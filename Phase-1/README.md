# Phase-1

## Progress
Designed and implemented the core database schema for the Peer Project Collaboration Platform using Oracle Database (SQL). Created three tables: `users`, `projects`, and `applications`, with foreign key relationships linking them together.

## Approach
- **users**: stores student profile info and skills (user_id, name, email, password_hash, department, skills).
- **projects**: stores posted projects, linked to their creator via `creator_id` (FK → users.user_id), with a status constrained to 'Open' or 'Closed'.
- **applications**: acts as a join table linking users to the projects they applied for, via `project_id` and `applicant_id` (both FKs), with status constrained to 'Pending', 'Approved', or 'Rejected'.
- Used `CHECK` constraints to enforce valid status values directly in the database.
- Used `ON DELETE CASCADE` so related records clean up automatically if a user or project is deleted.

## Learnings
- Learned how foreign keys enforce relationships between tables.
- Learned the difference between Oracle SQL syntax (`VARCHAR2`, `NUMBER GENERATED ALWAYS AS IDENTITY`) versus MySQL/Postgres equivalents.
- Learned how `CHECK` constraints validate data at the database level instead of relying only on application code.
