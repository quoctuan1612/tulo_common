# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Fix error run db-migrate for container is running on Windows or MacOS: localhost => host.docker.internal

* Fix error run db-migrate(/bin/sh: 1: scripts/db_migrate: not found)
Step 1: sudo make bash
Step 2: migrate -path db/migrate_sql -database "postgres://db:5432/app_development?sslmode=disable&user=postgres" up
Step 3: exit
Step 4: sudo docker-compose run --rm -T app bin/rails db:schema:dump

* ...
