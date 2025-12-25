CREATE SCHEMA app AUTHORIZATION app_rw;

-- locking public schema for hardening
REVOKE CREATE ON SCHEMA public FROM PUBLIC;