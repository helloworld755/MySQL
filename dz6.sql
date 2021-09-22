-- Task 1

set @me = 610;

select count(*), from_user_id
from messages
where to_user_id = @me
group by from_user_id 
order by count(*) desc
limit 1;

-- Task 2

SELECT count(*)
FROM likes AS l
INNER JOIN
     (SELECT user_id
     FROM profiles
     ORDER BY (now()-birthday) asc
     LIMIT 10) as l2
  ON l.user_id = l2.user_id

-- Task 3
  
select count(*), 'women'
from likes as l
where user_id in (select user_id from profiles where gender = 'f')
union
select count(*), 'men'
from likes as l
where user_id in (select user_id from profiles where gender = 'm');

-- Task 4

(select user_id, count(*) as activity
from likes
group by user_id
order by activity asc
limit 10)

union

(select user_id, count(*) as activity
from media
group by user_id
order by activity asc
limit 10)

union

(select user_id, count(*) as activity
from photo_albums
group by user_id
order by activity asc
limit 10)

union 

(select user_id, count(*) as activity
from post_likes
group by user_id
order by activity asc
limit 10)

union 

(select user_id, count(*) as activity
from posts
group by user_id
order by activity asc
limit 10)

order by activity asc
limit 10;

