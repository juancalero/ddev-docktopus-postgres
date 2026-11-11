-- #ddev-generated: If you want to edit and own this file, remove this line.
-- Seed data for the Node API (from the docktopus stack).
-- Runs only the first time the PostgreSQL data volume is created.
CREATE TABLE IF NOT EXISTS "user" (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO "user" (name, email) VALUES
('Alice Smith', 'alice@example.com'),
('Bob Johnson', 'bob@example.com'),
('Charlie Lee', 'charlie@example.com'),
('Diana Adams', 'diana@example.com'),
('Ethan Wright', 'ethan@example.com'),
('Fiona Green', 'fiona@example.com'),
('George Young', 'george@example.com'),
('Hannah Scott', 'hannah@example.com'),
('Isaac Turner', 'isaac@example.com'),
('Julia Brown', 'julia@example.com');
