-- app_rw: full read/write access
-- app_ro: read-only access

-- Allow sandbox_user and app_rw to access schema objects
GRANT USAGE ON SCHEMA app TO app_rw;

-- Existing tables:
-- Allow app_rw to fully operate on existing tables
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA app
TO app_rw;
-- Allow app_ro
GRANT SELECT
ON ALL TABLES IN SCHEMA app
TO app_ro;

-- Future tables:
-- Ensure new tables automatically grant rights to app_rw
ALTER DEFAULT PRIVILEGES FOR ROLE app_rw IN SCHEMA app
GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLES TO app_rw;
-- Ensure future tables automatically grant SELECT to app_ro
ALTER DEFAULT PRIVILEGES FOR ROLE app_rw IN SCHEMA app
GRANT SELECT ON TABLES TO app_ro;

-- Existing sequences:
-- Grant access to sequences for auto-incrementing fields
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA app TO app_rw;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA app TO app_ro;
-- Future sequences
-- Ensure sequences created by app_rw automatically grant privileges
ALTER DEFAULT PRIVILEGES FOR ROLE app_rw IN SCHEMA app
GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO app_rw;

ALTER DEFAULT PRIVILEGES FOR ROLE app_rw IN SCHEMA app
GRANT USAGE ON SEQUENCES TO app_ro;