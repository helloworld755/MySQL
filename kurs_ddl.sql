DROP DATABASE IF EXISTS netflix;
CREATE DATABASE netflix;
USE netflix;


DROP TABLE IF EXISTS genres;
CREATE TABLE genres(
	id SERIAL,
    genre_name VARCHAR(50)
) COMMENT '∆анр Ц комеди€, драма, боевик, документальный и т.д.';


DROP TABLE IF EXISTS `all`;
CREATE TABLE `all` (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(30) COMMENT С‘ильм или сериалТ,
    name VARCHAR(255),
    description TEXT,
    genre_id BIGINT UNSIGNED NOT NULL,
    rating FLOAT,
    
    FOREIGN KEY (genre_id) REFERENCES genres(id)
) COMMENT 'ID всех фильмов и сериалов';


DROP TABLE IF EXISTS movies;
CREATE TABLE movies(
	id SERIAL,
	all_id BIGINT UNSIGNED NOT NULL,
	videofile TEXT
) COMMENT Сќтдельный фильмТ;


ALTER TABLE movies ADD CONSTRAINT video_movie
    FOREIGN KEY (all_id) REFERENCES `all`(id);
   

DROP TABLE IF EXISTS TV_seasons;
CREATE TABLE TV_seasons(
	id SERIAL,
	all_id BIGINT UNSIGNED NOT null,
	season_name VARCHAR(100),
	season_description TEXT
) COMMENT 'ќтдельный сезон, views Ц среднее по всем эпизодам';


ALTER TABLE TV_seasons ADD CONSTRAINT show_season
    FOREIGN KEY (all_id) REFERENCES `all`(id);


DROP TABLE IF EXISTS TV_episodes;
CREATE TABLE TV_episodes(
	id SERIAL,
	season_id BIGINT UNSIGNED NOT NULL,
	episode_name VARCHAR(100),
	episode_description TEXT,
	videofile TEXT
) COMMENT Сќтдельный эпизодТ;


ALTER TABLE TV_episodes ADD CONSTRAINT season_episode
    FOREIGN KEY (season_id) REFERENCES TV_seasons(id);
   

DROP TABLE IF EXISTS actors;
CREATE TABLE actors (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(70),
    lastname VARCHAR(70),
    country VARCHAR(70),
 	picture TEXT,
	
    INDEX actor_firstname_lastname_idx(firstname, lastname)
) COMMENT СјктерыТ;


DROP TABLE IF EXISTS `cast`;
CREATE TABLE `cast` (
	id SERIAL,
	all_id BIGINT UNSIGNED NOT NULL,
	actor_id BIGINT UNSIGNED NOT NULL,
	`role` VARCHAR(70),
	type_of_role VARCHAR(255)
) COMMENT '—писок ролей актеров в фильмах';


ALTER TABLE `cast` ADD CONSTRAINT cast_video
    FOREIGN KEY (all_id) REFERENCES `all`(id);
   

ALTER TABLE `cast` ADD CONSTRAINT cast_actor
    FOREIGN KEY (actor_id) REFERENCES actors(id);


DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(70),
    lastname VARCHAR(70),
    country VARCHAR(70),
    email VARCHAR(120) UNIQUE,
 	`password` VARCHAR(100),
	phone BIGINT UNSIGNED UNIQUE,
	
    INDEX user_firstname_lastname_idx(firstname, lastname)
) COMMENT Сѕользователи NetflixТ;


DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	all_id BIGINT UNSIGNED NOT NULL,
	like_type CHAR(1) comment Сl/dТ,
	
	PRIMARY KEY (user_id, all_id)
) COMMENT Сѕользователи NetflixТ;


ALTER TABLE likes ADD CONSTRAINT like_user 
FOREIGN KEY (user_id) REFERENCES users(id);


ALTER TABLE likes ADD CONSTRAINT like_video 
FOREIGN KEY (all_id) REFERENCES `all`(id);


DROP TABLE IF EXISTS watch_later;
CREATE TABLE watch_later (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	all_id BIGINT UNSIGNED NOT NULL,
	
	PRIMARY KEY (user_id, all_id)
) COMMENT 'ќтмеченное дл€ просмотра позже пользователем';


ALTER TABLE watch_later ADD CONSTRAINT watch_user 
FOREIGN KEY (user_id) REFERENCES users(id);


ALTER TABLE watch_later ADD CONSTRAINT watch_video 
FOREIGN KEY (all_id) REFERENCES `all`(id);
