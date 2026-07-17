#1. nstall MySQL Community Server or SQLite on your system and verify the installation by connecting to the database using the command line or a GUI tool like MySQL Workbench or DB Browser for SQLite.


CREATE DATABASE foodie_app;
USE foodie_app;

CREATE TABLE restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    location VARCHAR(100)
);

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE,
    created_at DATETIME
);
#| Column         | Data Type      | Reason                                                                      |
#| -------------- | -------------- | --------------------------------------------------------------------------- |
#| `user_id`      | `INT`          | Stores numeric user IDs and acts as the primary key.                        |
#| `username`     | `VARCHAR(50)`  | Stores usernames of varying lengths.                                        |
#| `email`        | `VARCHAR(100)` | Stores email addresses and is marked `UNIQUE`.                              |
#| `phone_number` | `VARCHAR(15)`  | Phone numbers may include `+` and leading zeros, so `VARCHAR` is preferred. |
#| `created_at`   | `DATETIME`     | Stores the date and time when the account was created.                      |

CREATE TABLE restaurants (
    id INT PRIMARY KEY
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    location VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    location VARCHAR(100)
);