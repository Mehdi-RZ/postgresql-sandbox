CREATE ROLE app_rw NOLOGIN;
CREATE ROLE app_ro NOLOGIN;
CREATE ROLE sandbox_user LOGIN;

GRANT app_rw TO sandbox_user;