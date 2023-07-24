use employees;

-- 1. Write a SQL query to find the salaries of all employees

select * from employees;

 -- select employee_id,first_name,last_name,salary from employees;
 
 select employee_id,concat(first_name,' ',last_name) as 'Full Name' , salary from employees;
 
 -- 2. Write a SQL query to find the unique designations of the employees. Return job name.
 
 select DISTINCT job_id as 'JOB_NAME' from employees;
 
 select job_id as 'JOB_NAME' from employees group by job_id;
 
 -- 3. write a SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars
 
 select employee_id,concat(first_name,' ',last_name) as 'Full Name' ,(salary+((salary*15)/100)) as 'Increment_salary' from employees;
 
 
 
 -- select * from employees;
 
 -- 4. Write a SQL query to list the employee's name and job name as a format of "Employee & Job".
 
  select employee_id,concat(first_name,' ',last_name,' ','JOB TITLE-',' ',JOB_ID) as 'Employee & Job'  from employees;
  
  -- 5. Write a SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.
  
  select employee_id,concat(first_name,' ',last_name) as 'Full Name' , salary,date_format(hire_date,'%M %d, %Y') from employees;
  
  
  -- 9. Write a SQL query to find those employees who joined before 1991. Return complete information about the employees
  
  select * from employees where date_format(hire_date,'%Y') < 1991;
  
  /* select * from employees order by first_name desc ;
  
  select * from employees where salary > 10000 order by salary desc;
  
  select * from employees where first_name like '%a';
  
  select * from employees where first_name like '_e%';
  
  select * from employees where first_name like 'n___a'; */
  
  
  
  
  
  -- select date_format(current_date(), '%M %D %Y') as 'TODAY DATE' , date_format(current_date(), '%W') as 'TODAY DAY' ;
  
  
  
  
  -- select * from employees;
 
  -- select * from departments;
  
  /* select first_name,last_name,department_name
  from employees as e join departments as d 
  on e.department_id = d.department_id 
  where department_name = 'IT'
  order by first_name desc;
  
  
  
  
  select count(employee_id) as 'Total_Emp',department_name 
  from employees as e join departments d
  on e.department_id = d.department_id
  group by department_name
  order by Total_emp desc 
  limit 1;
  
  select DISTINCT   j.job_title as JOB_NAME 
  from employees as e
  inner join jobs as j on e.job_id = j.job_id ;
  
  
    select concat('Name of the Employee:-',e.first_name,' ',e.last_name,' ','Title of Employee:-',j.job_title) as 'Employee & Jobs' 
  from employees as e
  inner join jobs as j on e.job_id = j.job_id ; */
  

  
  -- 6. Write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
select length(first_name) as 'employee_name_length' from employees;

-- 7. Write a SQL query to find the employee ID, salary, and commission of all the employees. 

-- select * from employees;

select employee_id, salary , (salary*commission_pct) as 'commission_emp' from employees;

-- 8. Write a SQL query to find the unique department with jobs. Return department ID, Job name. 

/* select * from departments;
select * from employees;
select * from jobs;
select * from job_history; */

select jh.job_id,job_title as 'JOB_NAME',jh.department_id,d.department_name
from jobs as j inner join job_history as jh
inner join departments as d
on j.job_id = jh.job_id
group by d.department_name;

-- 10. Write a SQL query to compute the average salary of those employees who work as ‘shipping clerk’. Return average salary.

select avg(salary) as 'avg_salary',j.job_title
from employees as e join jobs as j
on e.job_id = j.job_id
where j.job_title = 'shipping clerk'
;
SET SQL_SAFE_UPDATES = 0;


-- count no of employee work in shipping_clerk

select * from jobs where job_title = 'shipping clerk' ;

select count(employee_id) as 'no_of_emp',job_id from employees 
group by job_id
order by job_id desc  ;