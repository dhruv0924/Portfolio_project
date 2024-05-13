create database projects;
USE projects;
select *from hr;
alter table hr
change column id emp_id varchar(20) NULL;

describe hr;

set sql_safe_updates=0;

select birthdate from hr;

update hr
set birthdate=CASE
when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;

alter table hr
modify column birthdate date;


update hr
set hire_date=CASE
when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;

select hire_date from hr;

UPDATE hr
SET termdate = NULL
WHERE termdate = '' OR termdate IS NULL;

UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NUL and termdate!='';

select termdate from hr;

alter table hr
modify column termdate date;
alter table hr
modify column hire_date date;

alter table hr add column age int;

update hr
 set age=timestampdiff(YEAR,birthdate,CURDATE());
 
 
select birthdate,age from hr;

select 
 min(age)as youngest,
max(age) as oldest
from hr;


UPDATE hr
SET termdate = NULL
WHERE termdate = '';

UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL;
select termdate from hr;
UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL and termdate!='';
UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;
