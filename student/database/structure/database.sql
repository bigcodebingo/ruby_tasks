CREATE DATABASE student;

CREATE TABLE student (
	id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    phone TEXT UNIQUE,
    email TEXT UNIQUE,
    telegram TEXT UNIQUE,
    github TEXT UNIQUE,
);