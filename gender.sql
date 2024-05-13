select gender,count(*) as count
from hr
where age>=21 and termdate is NULL
GROUP BY gender;
-- query2
select race,count(*) as count
from hr
where age>=21 and termdate is NULL
GROUP BY race
order by count(*) desc;