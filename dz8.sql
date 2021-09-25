-- Task 1

set @me = 610;

select sum(quan), friend from

((select count(*) as quan, from_user_id as friend
from messages m 
where to_user_id = @me
group by from_user_id)

union all

(select count(*) as quan, to_user_id as friend
from messages m 
where from_user_id = @me
group by to_user_id)) as tbl

group by friend
order by sum(quan) desc;



-- Task 2

select count(*)
from likes as l
inner join
     (select user_id
     from profiles
     order by (now()-birthday) asc
     limit 10) as l2
  on l.user_id = l2.user_id
  
  
  
-- Task 3
  
select prof.gender, count(*) from profiles prof
join likes lk on prof.user_id = lk.user_id
group by prof.gender;