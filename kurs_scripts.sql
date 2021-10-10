select `type`, count(*) as `number` from `all`
group by `type`;



select * from `all`
order by rating desc
limit 3;



select avg(rating) from `all`
where `type` = 'TV Show';



select country as list_of_countries from actors
group by country;



select `type`, name, max(rating) from `all`
where `type` = 'Movie'
union
select `type`, name, max(rating) from `all`
where `type` = 'TV Show';



select a.firstname, a.lastname, c.`role`, al.name from actors a 
join
(select `role`, actor_id, all_id from `cast`) c
on a.id = c.actor_id
join 
(select name, id from `all`) al
on al.id = c.all_id;



select u.country as 'gave likes' from users u
join
(select like_type, user_id from likes where like_type = 'l') l
on l.user_id = u.id;



select a.name, ts.season_name, te.episode_name from `all` a
join
(select id, all_id, season_name from tv_seasons) ts
on ts.all_id = a.id
join 
(select season_id, episode_name from tv_episodes) te
on te.season_id = ts.id
order by a.name asc;



create view view_1 as
select u.firstname, u.lastname, a.name from users u
join watch_later wl
on wl.user_id = u.id
join `all` a 
on a.id = wl.all_id;

select * from view_1;



create view view_2 as
select g.genre_name, a.name, a.rating from `all` a
join genres g
on a.genre_id = g.id
order by g.genre_name asc;

select * from view_2;



drop procedure if exists TV_Characters;
delimiter //
create procedure TV_Characters()
begin
	select a.name as 'Movie or TV Show', c.`role` as 'Character', ac.firstname as 'Actor Name', ac.lastname as 'Actor Lastname' from `all` a 
	join `cast` c on c.all_id = a.id
	join actors ac on ac.id = c.actor_id
	where a.`type` = 'TV Show';
end //
delimiter ;

call TV_Characters;



drop trigger if exists new_user_null;
delimiter //
create trigger new_user_null
before insert on users
for each row
begin 
	if(isnull(new.firstname)
	or isnull(new.lastname)
	or isnull(new.country)
	or isnull(new.email)
	or isnull(new.password)
	or isnull(new.phone))
	then 
	signal sqlstate '45000' set message_text = 'Null is not allowed!';
end if;
end //
delimiter ;

INSERT INTO netflix.users(firstname, lastname, country, email, `password`, phone)
VALUES (null, 'Davidson', 'USA', 'morty@gmail.com', '123', '123456');
