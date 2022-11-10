CREATE DATABASE Hack_a_Gram;

USE Hack_a_Gram;

CREATE TABLE IF NOT EXISTS user (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL,
	password VARCHAR(200) NOT NULL,
    lastname VARCHAR(100),	
	avatar VARCHAR(255),
    bio VARCHAR(500),
    url VARCHAR(255),
	privacy ENUM ('private', 'public') DEFAULT 'public',
	createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS follower (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
idUser INT UNSIGNED NOT NULL,
	FOREIGN KEY (idUser) REFERENCES user (id)
    ON DELETE CASCADE,	
idFollower INT UNSIGNED NOT NULL,
	FOREIGN KEY (idFollower) REFERENCES user (id)
    ON DELETE CASCADE	
);

CREATE TABLE IF NOT EXISTS post (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
authorComment VARCHAR(500) NOT NULL,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
hashtag VARCHAR (255),
idUser INT UNSIGNED NOT NULL,
	FOREIGN KEY (idUser) REFERENCES user (id)
    ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS photo (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255),
idPost INT UNSIGNED NOT NULL,
FOREIGN KEY (idPost) REFERENCES post (id)
ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS likes (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
idPost INT UNSIGNED NOT NULL,
FOREIGN KEY (idPost) REFERENCES post (id)
ON DELETE CASCADE,
liked  TINYINT DEFAULT 0,
idUser INT UNSIGNED NOT NULL,
FOREIGN KEY (idUser) REFERENCES user (id)
ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS favorite (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
idPost INT UNSIGNED NOT NULL,
FOREIGN KEY (idPost) REFERENCES post (id)
ON DELETE CASCADE,
idUser INT UNSIGNED NOT NULL,
FOREIGN KEY (idUser) REFERENCES user (id)
ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS comment (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
body VARCHAR (500) NOT NULL,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
idPost INT UNSIGNED NOT NULL,
FOREIGN KEY (idPost) REFERENCES post (id)
ON DELETE CASCADE,
idUser INT UNSIGNED NOT NULL,
FOREIGN KEY (idUser) REFERENCES user (id)
ON DELETE CASCADE
);

/* DROP TABLE IF EXISTS comment; 
DROP TABLE IF EXISTS favorite;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS follower;
DROP TABLE IF EXISTS user; */


SHOW TABLES;