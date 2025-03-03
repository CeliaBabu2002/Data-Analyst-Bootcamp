create database xyz;

create table student_c(
rollno int Primary Key,
Name_s varchar(20),
phno int Unique,
Salary int default 25000,
age int check(age>=20),
city_id int,
Foreign key (city_id) references city(id)
);



create table city(
id int Primary key,
name_c varchar(20) Unique);

insert into student_c(rollno,Name_s,phno,age,city_id) values(1,'Celia',968979556,20,1);

insert into student_c(rollno,Name_s,phno,Salary,age,city_id) values(2,'savio',28287875,541898,21,3),(3,'shiny',055552222,587179,30,2),(4,'babu',5418454,18787,56,2);
insert into student_c(rollno,Name_s,phno,Salary,age,city_id) values(5,'babu',28776716,7817899,52,3);

insert into city(id,name_c)values(2,'surat'),(3,'thrissur'),(4,'gujarat');

select distinct Name_s from student_c

select Name_s from student_c
where age between 20 and 25;

select * from city
where name_c  in ('thrissur','kerala');


select top 3 * from student_c
where age>20 ;


alter table student_c
add mark int ;

select mark from student_c;

select count(rollno) from student_c;

update student_c
set mark = 99
where rollno =5;
)
select top (3) Name_s
from student_c
group by Name_s
order by max(mark)desc;


alter table student_c
add city varchar(20);

update student_c
set city ='Thrissur'
where rollno=5;



SELECT city,AVG(mark) as avg_m  from student_c
group by city
order by avg(mark) asc;



update student_c
set Name_s='dad'
where Name_s='babu';


select * from student_c
order by Name_s asc;

create table employeet(
empid int Primary key,
ename varchar(20),
eage int Not Null,
design int Not Null,
Foreign key(design) references dtable(id)
on update cascade
on delete cascade);

drop table employeet;


create table dtable(
id int Primary key,
design varchar(20)
);

insert into dtable values
(1,'hr'),(2,'manager'),(3,'accountant');



truncate table employeet;

insert into employeet values
(1,'celia',21,1),
(2,'savio',22,2),
(3,'shiny',54,3),
(4,'babu',60,2);

create view view1 as 
select empid,ename from employeet;

select * from view1;






select empid,ename from employeet
where empid in (select empid from employeet where empid%2=0);

select * from employeet
select * from dtable

update dtable
set design ='owner'
where id=3;

alter table employeet 
add salary int default 250000;

alter table employeet
drop column salary;


alter table employeet
modify column salary float;

create table emp(
id int Primary key,
name_e varchar(20),
manager_id int);

insert into emp values(1,'bob',2),(2,'donald',3),(3,'caesy',1),(4,'riya',2);

select a.name_e as manager_n,b.name_e 
from emp as a
join
emp as b
on
a.id=b.manager_id;


