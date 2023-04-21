CREATE DATABASE iNeuron;
USE iNeuron;
CREATE TABLE Worker (
ID int PRIMARY KEY AUTO_INCREMENT,
First_Name VARCHAR (20) NOT NULL ,
Last_Name VARCHAR(20) ,
EMAIL varchar(50) ,
DEPARTMENT VARCHAR(20) NOT NULL ,
Salary INT ,
Join_Date DATE);
select * from worker;
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) values ('Vishal','Rathore','vishalrathore@ineuron.com','Finance', 45000,'2018-02-12');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Rahul','Sarathe','rahulsarathe@ineuron.com','HR', 60000, '2017-04-17');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Anisha','Gour','anishagour@ineuron.com','Purchase', 30000, '2017-12-20');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Saksham','Mahajan','sakshammahajan@ineuron.com','Finance', 60000, '2019-11-12');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Aakash','Singh','amansingh@ineuron.com','Purchase',30000, '2017-09-05');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Ankit','Kumar','ankitkumar@ineuron.com','Marketing', 50000, '2020-01-14');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Riya','Agarwal','riyaagarwal@ineuron.com','Finance', 45000, '2018-04-23');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Nishit','Sharma','nishitsharma@ineuron.com','Purchase', 48000, '2018-10-10');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Samay','Raina','samayraina@ineuron.com','Marketing', 36000, '2017-08-22');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Aman','Singh','amansingh@ineuron.com','Finance', 45000, '2017-08-12');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Sarthak','Jain','sarthakjain@ineuron.com','Purchase', 48000, '2018-04-08');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Ashutosh','Patil','ashutoshpatil@ineuron.com','PR', 50000, '2019-09-26');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Harshit','Kumar','harshitkumar@ineuron.com','HR', 40000, '2018-06-05');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Ayush','Srivastav','ayushsrivastav@ineuron.com','Purchase', 30000, '2018-08-24');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Shreyansh','Deriya','shreyanshderiya@ineuron.com','PR', 35000, '2017-07-13');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Aryan','Sharma','aryansharma@ineuron.com','Finance', 60000, '2019-10-31');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Snehal','Reddy','snehalreddy@ineuron.com','HR', 40000, '2019-03-28');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Shubham','Mittal','shubhammittal@ineuron.com','PR', 35000,'2020-02-01');
INSERT INTO Worker (First_Name,Last_Name,EMAIL,DEPARTMENT,Salary,Join_Date) Values('Rakshit','Rao','rakshitao@ineuron.com','Marketing', 36000, '2018-11-30');

-- Que1)Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select First_name as WORKER_NAME
from worker;

-- Que2)Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct(DEPARTMENT)
from worker;

-- Que3) Write an SQL query to show the last 5 record from a table.
select *
from worker
where id>(select count(*) from worker)-5;

-- Que4)Write an SQL query to print the first three characters of FIRST_NAME from Worker.
select left(First_Name,3) as Three_char
from worker;

-- Que5) Write an SQL query to find the position of the alphabet (‘a’) in the first name
select id,position('a' in first_name) as Position_of_a
from worker;


-- Que6) Write an SQL query to print the name of employees who have highest salary in each department
select concat(first_name,' ',Last_name) as Full_name
from worker
where salary in (select max(salary)
from worker
group by department);

/*-- Que7) Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces 
         from the right side.*/
select rtrim(first_name) as First_name_corrected 
from worker;
       
-- Que8)Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct(Department),length(department) as L_Dept
from worker;

-- Que9) Write an SQL query to fetch nth max salaries from a table.
select distinct(salary)
from worker
group by salary
order by salary desc
limit 1
offset 1;  -- put offset of (n-1) for nth max value 

-- Que10)Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with 'A'
select id,replace(First_name,'a','A') as Upper_a
from worker;

/*-- Que11)Write an SQL query to print all Worker details from the Worker table order FIRST_NAME Ascending
 and DEPARTMENT Descending.*/
 select *
 from worker
 order by first_name asc,department desc;
				-- OR
  select *
 from worker
 order by department desc,first_name asc;
 
 -- Que12)Write an SQL query to fetch the names of workers who earn the highest salary.
 select concat(first_name,' ',Last_name) as Name
 from worker
 where salary in (select max(salary) from worker);
 
 /*- Que13)Write an SQL query to print details of workers excluding first names, “Vishal” and
    “Shubham” from Worker table.*/
   select * 
   from worker 
   where (First_name not in ('Vishal','Shubham'));
   
/*-- Que14)Write an SQL query to print details of the Workers whose FIRST_NAME ends with 
     ‘h’ and contains six alphabets.*/
     select *
     from worker
     where (First_name regexp 'h$' and length(First_name)=6);

-- Que15)Write a query to validate Email of Employee.
select *,if(email regexp '@','Valid','Invalid') as Email_Validation
from worker;

-- Que16)Write an SQL query to print details of the Workers who have joined in Feb’2020.
select * 
from worker
where (month(join_date)=02 and year(join_Date)=2020);

-- Que17)Write an SQL query to fetch duplicates have matching data in some fields of a table.
select First_name,Last_name,Email,department,salary,join_date,count(*) as Count_Duplicates
from worker
group by First_name,Last_name,Email,department,salary,join_date
having count(*)>1;

-- Que18)How to remove duplicate rows from Employees table.
delete
from worker
where id not in (select id
from (select min(id) from worker) as D_worker
group by First_name,Last_name,Email,department,salary,join_date);
select * from worker;
-- Que19)Write an SQL query to show only odd rows from a table.
select *
from worker
where id%2!=0;

-- Que20)Write an SQL query to clone a new table from another table.
create table clone_worker as (
select *
from worker);
select *
from clone_worker;

-- Que21)Write an SQL query to fetch intersecting records of two tables.
select distinct w.id,w.First_name,w.Last_name,w.Email,w.department,w.salary,w.join_date
from worker w
inner join worker w_1
on w.id=W_1.id;

-- Que22)Write an SQL query to show records from one table that another table does not have.
select distinct w.id,w.First_name,w.Last_name,w.Email,w.department,w.salary,w.join_date
from worker w
left join worker W_1
on w.id=w_1.id
where w.id is null;

-- Que23)Write an SQL query to show the top n (say 10) records of a table.
select *
from worker
order by id
limit 10;

-- Que24)Write an SQL query to determine the nth (say n=5) highest salary from a table.
select salary
from worker
group by salary
order by salary desc
limit 1
offset 4;  -- put offset of (n-1) for nth max value 
				-- OR
select salary
from worker
order by salary desc
limit 1
offset 4;  -- put offset of (n-1) for nth max value 

-- Que25)Write an SQL query to determine the 5th highest salary without using TO P or LIMIT method
select salary
from (select salary,dense_rank() over (order by id) as Num
from worker )as W_Table
where Num=5;

-- Que26)Write an SQL query to fetch the list of employees with the same salary.
select First_name,salary,count(salary) over (partition by Salary) as Cout
from worker
order by salary desc;