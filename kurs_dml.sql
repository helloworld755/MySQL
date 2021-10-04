INSERT INTO genres(genre_name)
VALUES ('Comedy'), ('History'), ('Drama'), ('Action'), ('Fantasy');


INSERT INTO `all`(`type`, name, description, genre_id, views)
VALUES ('TV Show', 'How I Met Your Mother', 'Some text', '1', null),
		('Movie', 'Pride and Prejudice', 'Some text', '2', null),
		('Movie', 'Harry Potter', 'Some text', '5', null),
		('TV Show', 'The Crown', 'Some text', '2', null),
		('Movie', 'Quantum of Solace', 'Some text', '4', null),
		('Movie', 'The Mask', 'Some text', '1', null),
		('Movie', 'Pirates of Caribbean', 'Some text', '5', null),
		('TV Show', 'Black Mirror', 'Some text', '3', null),
		('TV Show', 'Sherlock', 'Some text', '4', null),
		('Movie', 'Me Before You', 'Some text', '3', null);


INSERT INTO movies(all_id, videofile)
VALUES ('2', 'link'),
		('3', 'link'),
		('5', 'link'),
		('6', 'link'),
		('7', 'link'),
		('10', 'link');


INSERT INTO TV_seasons(all_id, season_name, season_description, views)
VALUES ('1', 'Season 1', 'Some text', null),
		('8', 'Season 2', 'Some text', null),
		('4', 'Season 2', 'Some text', null),
		('1', 'Season 2', 'Some text', null),
		('1', 'Season 3', 'Some text', null),
		('8', 'Season 1', 'Some text', null),
		('4', 'Season 1', 'Some text', null),
		('9', 'Season 1', 'Some text', null),
		('4', 'Season 3', 'Some text', null),
		('8', 'Season 3', 'Some text', null);


INSERT INTO tv_episodes(season_id, episode_name, episode_description, views, videofile)
VALUES ('1', 'Episode 6', 'Text', null, 'link'),
		('2', 'Episode 3', 'Text', null, 'link'),
		('4', 'Episode 10', 'Text', null, 'link'),
		('6', 'Episode 15', 'Text', null, 'link'),
		('9', 'Episode 2', 'Text', null, 'link'),
		('3', 'Episode 8', 'Text', null, 'link'),
		('3', 'Episode 1', 'Text', null, 'link'),
		('5', 'Episode 4', 'Text', null, 'link'),
		('6', 'Episode 9', 'Text', null, 'link'),
		('2', 'Episode 5', 'Text', null, 'link');


insert into actors(firstname, lastname, country, picture)
values ('Daniel', 'Radcliffe', 'UK', 'link'),
		('Jim', 'Carrey', 'USA', 'link'),
		('Keira', 'Knightley', 'UK', 'link'),
		('Benedict', 'Cumberbatch', 'UK', 'link'),
		('Neil Patrick', 'Harris', 'USA', 'link');
	

INSERT INTO `cast`(all_id, actor_id, `role`, type_of_role)
VALUES ('2', '3', 'Elizabeth Benneth', 'Main'),
		('9', '4', 'Sherlock Holmes', 'Main'),
		('3', '1', 'Harry Potter', 'Main'),
		('6', '2', 'Stanley Ipkiss', 'Main'),
		('1', '5', 'Barney Stinson', 'Main');
		

INSERT INTO users(firstname, lastname, country, email, `password`, phone)
VALUES ('Andy', 'Johnson', 'USA', 'andy@gmail.com', 'jhbdjfghdb', '12345'),
		('Mary', 'Denver', 'UK', 'mary@gmail.com', 'dfsdhfskdhf', '23456'),
		('Cody', 'Clinton', 'Germany', 'cody@gmail.com', 'jdygfvidyf', '34567'),
		('Tracy', 'McConnell', 'USA', 'tracy@gmail.com', 'djyvgudyfgs', '45678'),
		('Linda', 'Yesman', 'France', 'linda@gmail.com', 'jwgfjygdfjg', '56789');
	
	
INSERT INTO likes(user_id, all_id, like_type)
VALUES ('3', '2', 'l'),
		('4', '6', 'l'),
		('1', '3', 'd'),
		('3', '9', 'd'),
		('2', '1', 'l'),
		('5', '4', 'l'),
		('1', '6', 'd'),
		('3', '5', 'd');


INSERT INTO watch_later(user_id, all_id)
VALUES ('2', '3'),
		('4', '1'),
		('2', '8'),
		('1', '4');