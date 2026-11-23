# Business Logic v1.1

> **Status:** Selected MVP baseline for implementation planning. Organizational ownership and launch details marked “to confirm” are not product-scope blockers.
>
> **Title:** Development of a Web-based En Passant Atlas: a visual chess-learning journal using Next.js for beginner players and school chess clubs
>
> **Platform:** Responsive web for desktop and mobile browsers. A separate Android app is deferred until pilot evidence supports it.

## Project Details

- **Team / operator:** To confirm before launch
- **Code name:** En Passant Atlas
- **Short code:** To confirm before release tagging
- **Short description:** A beginner-friendly chess study journal that pairs concise lessons with interactive board positions and private learner notes.
- **Target market:** Beginner chess players and school chess clubs.
- **Problem:** Beginners often study positions from scattered sources and lack a simple way to practice a concept and keep useful study notes together.
- **Value proposition:** Find a short lesson, explore its position, reveal the solution, and save the learning for later.
- **Framework:** Next.js for the web application. This is the selected implementation direction for v1.1; confirm deployment and team constraints during technical planning.
- **MVP validation:** In a moderated pilot with at least five beginner learners, at least four should independently find a lesson, try its board position, save a note, and reopen that journal entry. Record task completion and usability issues; do not add individual performance tracking to the product.

## User Levels

| Role | Description |
|---|---|
| Visitor | Browses published lessons and explores their board positions without an account. |
| Learner | Signs in with Google to save lessons and private notes in a personal journal. |
| Content editor | Creates, edits, and publishes curated lessons. Access is granted to named trusted editors. |
| System administrator | Manages editor access and removes incorrect or harmful content. Routine access to private learner notes is not permitted. |

There is no public posting, messaging, social feed, or separate moderator role in MVP. This keeps moderation and access control small.

## System Requirements

1. The app shall let visitors browse and search a curated collection of beginner chess lessons without signing in.
2. Each published lesson shall have one learning objective, a concise explanation, and at least one chess position.
3. The lesson board shall let a visitor make and undo moves and request the intended solution or line.
4. A learner shall be able to sign in using Google and save a lesson to a private study journal with an optional note.
5. A learner shall be able to list, reopen, edit, and delete their own journal entries and notes.
6. A content editor shall be able to draft, edit, and publish lessons; visitors shall only see published lessons.
7. The responsive site shall support current desktop and mobile browsers, provide clear empty and error states, and make navigation and lesson text usable by keyboard and assistive technology. Board interaction must not rely on color alone.

## Required Solution Layers

1. **Privacy:** Store only the account identifier and journal data needed for the requested feature. Do not collect location or sell personal data. Publish retention and deletion rules before launch; support deletion of journal data and account-deletion requests.
2. **Security:** Validate Google identity on the server and enforce per-account authorization for every journal read or write. Restrict editor and administrator actions to explicitly authorized accounts. Never expose one learner's notes to another.
3. **Content quality:** Only trusted editors may publish lessons. Record source and attribution for externally derived explanations or positions and provide a way to report a correction.
4. **Accessibility:** Provide understandable text instructions for board tasks and keyboard-accessible navigation. Do not communicate the correct move solely through color.
5. **Operations:** Define an owner and verify a restore procedure for published lesson content before production. Collect no individual learning analytics in MVP.

Confirm applicable privacy and accessibility obligations for the operator, audience, and launch jurisdictions before release. This document is a product baseline, not a legal compliance determination.

## MVP Features and Access

| Feature | Visitor | Learner | Editor | Administrator |
|---|---:|---:|---:|---:|
| Browse/search published lessons | Yes | Yes | Yes | Yes |
| Explore board, make/undo moves, reveal solution | Yes | Yes | Yes | Yes |
| Save lessons and private notes | No | Own entries | Own entries | Own entries |
| Draft, edit, and publish lessons | No | No | Yes | Yes |
| Manage editor access and remove content | No | No | No | Yes |

## Deliberately Out of Scope

Separate Android app, live multiplayer, engine analysis, automated coaching, tournaments, ratings, streaks, leaderboards, social sharing, subscriptions, public user-generated lessons, coach dashboards, and classroom analytics. Reconsider only when learner feedback demonstrates a clear need.

## Decisions and Remaining Confirmations

- **Decided for v1.1:** responsive web MVP; beginner and school chess-club audience; curated lessons; interactive practice positions; Google sign-in for private journal; no account required to browse; Next.js implementation direction.
- **To confirm before launch:** operating team, release short code, lesson licensing/attribution details, launch jurisdiction, and production data-retention period.
- **Validation gate:** run the five-learner usability pilot before treating the workflow as validated. Pilot findings may change the backlog, not silently expand this MVP.

## Notes

This version replaces the v1.0 placeholders with a narrow, testable product baseline. It does not claim that the application, Google integration, privacy controls, or framework have already been implemented.
