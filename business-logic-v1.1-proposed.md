# Business Logic v1.1 (Proposed)

> **Status:** Proposal for stakeholder review; not an approved product or architecture decision.
>
> **Draft title:** Development of a Web-based En Passant Atlas: a visual chess-learning journal using Next.js for beginner players and school chess clubs
>
> **Platforms:** Responsive web (desktop and mobile browsers). Android is deferred; the responsive site keeps the first release focused and avoids maintaining two clients.

## Project Details

- **Team:** To be confirmed
- **Code name:** En Passant Atlas (working title)
- **Short code:** To be confirmed
- **Short description:** A beginner-friendly chess study journal that pairs short, curated lessons with interactive board positions and personal notes.
- **Target market:** Beginner chess players and school chess clubs seeking a simple way to study and revisit chess concepts.
- **Primary problem:** Beginners encounter lessons and positions across different sources but lack a focused place to practice a position and record what they learned.
- **Value proposition:** Learn one concept at a time, try the position on a board, and keep a private record of useful lessons.
- **Proposed technology:** Next.js for the web application. Confirm stack against implementation constraints before adoption.
- **MVP success measure:** In a small pilot, learners can find a lesson, attempt its position, save a note, and return to that study entry without assistance. Set numeric adoption and retention targets after pilot recruitment.

## User Levels

| Role | What they can do |
|---|---|
| Learner | Browse lessons without an account; sign in to save personal study entries and notes. |
| Content editor | Create, revise, and publish curated lessons. Limited to named trusted editors for MVP. |
| System administrator | Manage access and remove harmful or incorrect content; no routine access to private learner notes. |

No public user submissions, social feed, messaging, or moderator tier is in MVP. Fewer roles reduce moderation and access-control work.

## MVP System Requirements

1. The app shall let visitors browse and search a small, curated set of beginner chess lessons without signing in.
2. Each lesson shall state one learning objective and provide an explanation plus a chess position that can be explored on an interactive board.
3. The learner shall be able to make and undo moves on the board; the app shall show the intended line or answer after the learner requests it.
4. A learner shall be able to sign in with Google and save a lesson to a personal study journal with an optional private note.
5. The journal shall list saved entries and allow the learner to reopen or delete an entry and its note.
6. Content editors shall be able to draft, edit, and publish lessons; visitors shall see published lessons only.
7. The site shall work on current desktop and mobile browsers, provide clear empty/error states, and meet basic keyboard and screen-reader accessibility expectations for navigation and lesson text.

**Out of scope for MVP:** Android app, live multiplayer, engine analysis, automated coaching, tournaments, leaderboards, social sharing, paid plans, user-generated public lessons, and classroom analytics. Revisit only when pilot evidence supports them.

## Required Solution Layers

1. **Privacy:** Collect only account identifier, saved lesson IDs, and learner-authored notes needed for the journal. Do not collect location or sell personal data. Publish a retention/deletion policy before launch; let learners delete journal entries and request account deletion.
2. **Security:** Validate Google identity on the server; authorize journal access per account; keep editor/admin actions restricted and auditable. Never expose one learner's private notes to another.
3. **Content quality:** Publish lessons only through trusted editors; include source/attribution for externally derived positions or explanations and a correction path.
4. **Accessibility and usability:** Keep lesson text readable without relying on board color alone; provide keyboard-operable navigation and instructions for board interaction.
5. **Operational basics:** Back up published lesson content and define a restore owner before production. Do not create analytics that identify an individual learner unless separately justified and disclosed.

Applicable privacy and accessibility obligations must be confirmed for the actual operator, audience, and launch jurisdictions; this proposal is not a compliance determination.

## MVP Features and Access

| Feature | Visitor | Learner | Editor | Administrator |
|---|---:|---:|---:|---:|
| Browse/search published lessons | Yes | Yes | Yes | Yes |
| Explore lesson board and reveal answer | Yes | Yes | Yes | Yes |
| Save lesson and private note | No | Own entries | Own entries | Own entries |
| Manage lesson drafts and publish | No | No | Yes | Yes |
| Manage access and remove content | No | No | No | Yes |

## Assumptions and Decisions to Confirm

- The initial audience is novice learners and school chess clubs; interview a few learners/coaches before locking this positioning.
- Lessons are curated by the project team; no external content licensing has yet been confirmed.
- Google sign-in is the proposed account path, not a confirmed provider decision. Confirm whether a no-account journal or another sign-in option is needed.
- “Progress” in MVP means a saved study journal, not ratings, streaks, performance scoring, or coach dashboards.
- Confirm ownership, short code, launch geography, lesson sourcing, pilot size, and measurable success targets before implementation.

## Notes

This proposal replaces placeholders with a deliberately narrow first release. The existing `business-logic-v1.0.md` remains unchanged for comparison. No implementation, framework, provider, or compliance status is implied by this draft.
