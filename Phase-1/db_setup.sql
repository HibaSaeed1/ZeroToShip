-- =========================================================
-- Peer Project Collaboration Platform - Phase 1 Schema
-- Database: Oracle
-- =========================================================

DROP TABLE applications;
DROP TABLE projects;
DROP TABLE users;

-- 1. USERS TABLE
CREATE TABLE users (
    user_id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name           VARCHAR2(100) NOT NULL,
    email          VARCHAR2(255) UNIQUE NOT NULL,
    password_hash  VARCHAR2(255) NOT NULL,
    department     VARCHAR2(100),
    skills         VARCHAR2(255)
);

-- 2. PROJECTS TABLE
CREATE TABLE projects (
    project_id       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    creator_id       NUMBER NOT NULL,
    title            VARCHAR2(150) NOT NULL,
    description      CLOB,
    required_skills  VARCHAR2(255),
    status           VARCHAR2(10) DEFAULT 'Open' NOT NULL,
    CONSTRAINT chk_project_status CHECK (status IN ('Open', 'Closed')),
    CONSTRAINT fk_project_creator FOREIGN KEY (creator_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 3. APPLICATIONS TABLE
CREATE TABLE applications (
    application_id  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    project_id      NUMBER NOT NULL,
    applicant_id    NUMBER NOT NULL,
    status          VARCHAR2(10) DEFAULT 'Pending' NOT NULL,
    applied_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT chk_application_status CHECK (status IN ('Pending', 'Approved', 'Rejected')),
    CONSTRAINT fk_application_project FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE,
    CONSTRAINT fk_application_applicant FOREIGN KEY (applicant_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT uq_project_applicant UNIQUE (project_id, applicant_id)
);