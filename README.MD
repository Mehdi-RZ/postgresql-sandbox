# PostgreSQL Sandbox Project
## Summary / Goals

This project provides a PostgreSQL sandbox environment using Docker Compose.
### objectives
- a sandbox env while trying to get close to a prod env
- Provide demo databases and scripts for quick experimenting.

## Prerequisites
 - docker/podman
 - dokcer compose
 - `.env` file, replacing the values <tbd> in the `.example.env`
 - `.secrets/` folder, replacing the values <tbd> in each file in `.secrets.example`

## How to run
start the Database
```sh
docker compose up
```
connect using psql :
```sh
docker exec -it postgres-sandbox_db_1 psql -U sandbox_user -d sandbox_db
```
apply demos
```sh
docker exec -i postgres-sandbox_db_1 psql -U sandbox_user -d sandbox_db < db_demos/init_db_1.sql
```

## notes
- might need to make `init_db/02_set_passwords.sh` executable
```sh
chmod +x init_db/02_set_passwords.sh
```