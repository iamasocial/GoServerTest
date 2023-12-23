-- Active: 1703365526307@@127.0.0.1@5433@postgres
CREATE SCHEMA IF NOT EXISTS db;

CREATE TABLE db.users
(
    id SERIAL NOT NULL UNIQUE,
    name VARCHAR NOT NULL,
    username VARCHAR NOT NULL UNIQUE,
    password_hash VARCHAR NOT NULL
);

CREATE TABLE db.todo_lists
(
    id SERIAL NOT NULL UNIQUE,
    title VARCHAR NOT NULL,
    description VARCHAR
);

CREATE TABLE db.users_lists
(
    id SERIAL NOT NULL UNIQUE,
    user_id INT REFERENCES db.users(id) ON DELETE CASCADE NOT NULL,
    list_id INT REFERENCES db.todo_lists(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE db.todo_items
(
    id SERIAL NOT NULL UNIQUE,
    title VARCHAR NOT NULL,
    description VARCHAR,
    done BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE db.lists_items
(
    id SERIAL NOT NULL UNIQUE,
    item_id INT REFERENCES db.todo_items(id) ON DELETE CASCADE NOT NULL,
    list_id INT REFERENCES db.todo_lists(id) ON DELETE CASCADE NOT NULL
)

CREATE USER asocial WITH PASSWORD 'fsociety';

ALTER USER asocial WITH SUPERUSER;