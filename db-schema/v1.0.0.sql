-- En Passant Atlas MVP schema snapshot v1.0.0
-- Supabase PostgreSQL. Full snapshot: apply to a new project; safe to re-run.
-- Local/server relationships use *_uuid. `id` is a server-only index key and
-- must never be included in API or client sync payloads.

BEGIN;

CREATE TABLE IF NOT EXISTS public.platform_roles (
  id          bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  uuid        uuid NOT NULL UNIQUE DEFAULT gen_random_uuid(),
  user_uuid   uuid NOT NULL,
  role        text NOT NULL CHECK (role IN ('editor', 'administrator')),
  created_by  uuid,
  created_at  timestamptz NOT NULL DEFAULT now(),
  updated_at  timestamptz NOT NULL DEFAULT now(),
  archived_at timestamptz
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_platform_roles_live_user_role
  ON public.platform_roles (user_uuid, role) WHERE archived_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_platform_roles_user_uuid
  ON public.platform_roles (user_uuid);

CREATE TABLE IF NOT EXISTS public.lessons (
  id               bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  uuid             uuid NOT NULL UNIQUE DEFAULT gen_random_uuid(),
  slug             text NOT NULL,
  title            text NOT NULL,
  learning_objective text NOT NULL,
  body             text NOT NULL,
  attribution      text,
  status           text NOT NULL DEFAULT 'draft'
                   CHECK (status IN ('draft', 'published')),
  created_by       uuid,
  created_at       timestamptz NOT NULL DEFAULT now(),
  updated_at       timestamptz NOT NULL DEFAULT now(),
  published_at     timestamptz,
  archived_at      timestamptz
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_lessons_live_slug
  ON public.lessons (slug) WHERE archived_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_lessons_live_published_updated
  ON public.lessons (updated_at DESC)
  WHERE archived_at IS NULL AND status = 'published';

CREATE TABLE IF NOT EXISTS public.lesson_positions (
  id          bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  uuid        uuid NOT NULL UNIQUE DEFAULT gen_random_uuid(),
  lesson_uuid uuid NOT NULL,
  position    integer NOT NULL DEFAULT 1 CHECK (position > 0),
  fen         text NOT NULL,
  solution_san text[] NOT NULL DEFAULT ARRAY[]::text[],
  explanation text,
  created_by  uuid,
  created_at  timestamptz NOT NULL DEFAULT now(),
  updated_at  timestamptz NOT NULL DEFAULT now(),
  archived_at timestamptz
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_lesson_positions_live_order
  ON public.lesson_positions (lesson_uuid, position)
  WHERE archived_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_lesson_positions_lesson_uuid
  ON public.lesson_positions (lesson_uuid);

CREATE TABLE IF NOT EXISTS public.journal_entries (
  id          bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  uuid        uuid NOT NULL UNIQUE DEFAULT gen_random_uuid(),
  learner_uuid uuid NOT NULL,
  lesson_uuid uuid NOT NULL,
  note        text,
  created_by  uuid,
  created_at  timestamptz NOT NULL DEFAULT now(),
  updated_at  timestamptz NOT NULL DEFAULT now(),
  archived_at timestamptz
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_journal_entries_live_learner_lesson
  ON public.journal_entries (learner_uuid, lesson_uuid)
  WHERE archived_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_journal_entries_learner_updated
  ON public.journal_entries (learner_uuid, updated_at DESC);

-- UUID relationships intentionally have no REFERENCES constraints: clients may
-- sync partial datasets and child rows may arrive before parents. Validate these
-- relationships in API/business logic; indexes above support scoped lookups.

CREATE OR REPLACE FUNCTION public.has_content_role()
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = ''
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.platform_roles r
    WHERE r.user_uuid = (SELECT auth.uid())
      AND r.role IN ('editor', 'administrator')
      AND r.archived_at IS NULL
  );
$$;

REVOKE ALL ON FUNCTION public.has_content_role() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.has_content_role() TO anon, authenticated;

CREATE OR REPLACE FUNCTION public.has_administrator_role()
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = ''
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.platform_roles r
    WHERE r.user_uuid = (SELECT auth.uid())
      AND r.role = 'administrator'
      AND r.archived_at IS NULL
  );
$$;

REVOKE ALL ON FUNCTION public.has_administrator_role() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.has_administrator_role() TO authenticated;

ALTER TABLE public.platform_roles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lessons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lesson_positions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.journal_entries ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS platform_roles_read_self_or_editor ON public.platform_roles;
CREATE POLICY platform_roles_read_self_or_editor ON public.platform_roles
  FOR SELECT TO authenticated
  USING (user_uuid = (SELECT auth.uid()) OR public.has_content_role());
DROP POLICY IF EXISTS platform_roles_manage_editor ON public.platform_roles;
CREATE POLICY platform_roles_manage_editor ON public.platform_roles
  FOR ALL TO authenticated
  USING (public.has_administrator_role())
  WITH CHECK (public.has_administrator_role());

DROP POLICY IF EXISTS lessons_read_published_or_editor ON public.lessons;
CREATE POLICY lessons_read_published_or_editor ON public.lessons
  FOR SELECT TO anon, authenticated
  USING ((status = 'published' AND archived_at IS NULL)
         OR (auth.uid() IS NOT NULL AND public.has_content_role()));
DROP POLICY IF EXISTS lessons_insert_editor ON public.lessons;
CREATE POLICY lessons_insert_editor ON public.lessons
  FOR INSERT TO authenticated
  WITH CHECK (public.has_content_role() AND created_by = (SELECT auth.uid()));
DROP POLICY IF EXISTS lessons_update_editor ON public.lessons;
CREATE POLICY lessons_update_editor ON public.lessons
  FOR UPDATE TO authenticated
  USING (public.has_content_role())
  WITH CHECK (public.has_content_role());

DROP POLICY IF EXISTS lesson_positions_read_published_or_editor ON public.lesson_positions;
CREATE POLICY lesson_positions_read_published_or_editor ON public.lesson_positions
  FOR SELECT TO anon, authenticated
  USING ((archived_at IS NULL AND EXISTS (
           SELECT 1 FROM public.lessons l
           WHERE l.uuid = lesson_uuid AND l.status = 'published'
             AND l.archived_at IS NULL
         )) OR (auth.uid() IS NOT NULL AND public.has_content_role()));
DROP POLICY IF EXISTS lesson_positions_insert_editor ON public.lesson_positions;
CREATE POLICY lesson_positions_insert_editor ON public.lesson_positions
  FOR INSERT TO authenticated
  WITH CHECK (public.has_content_role() AND created_by = (SELECT auth.uid()));
DROP POLICY IF EXISTS lesson_positions_update_editor ON public.lesson_positions;
CREATE POLICY lesson_positions_update_editor ON public.lesson_positions
  FOR UPDATE TO authenticated
  USING (public.has_content_role())
  WITH CHECK (public.has_content_role());

DROP POLICY IF EXISTS journal_entries_owner_access ON public.journal_entries;
CREATE POLICY journal_entries_owner_access ON public.journal_entries
  FOR ALL TO authenticated
  USING (learner_uuid = (SELECT auth.uid()))
  WITH CHECK (learner_uuid = (SELECT auth.uid()) AND created_by = (SELECT auth.uid()));

GRANT SELECT ON public.lessons, public.lesson_positions TO anon, authenticated;
GRANT INSERT, UPDATE ON public.lessons, public.lesson_positions TO authenticated;
GRANT SELECT, INSERT, UPDATE ON public.journal_entries TO authenticated;
GRANT SELECT, INSERT, UPDATE ON public.platform_roles TO authenticated;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO authenticated;

COMMIT;
