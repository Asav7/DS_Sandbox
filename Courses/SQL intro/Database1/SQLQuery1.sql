create database mytestdb

use mytestdb

create table mytesttable
(
rollno int,
firstname varchar(50),
lastname varchar(50)
)

use mytestdb
select rollno, firstname, lastname from mytesttable

insert into mytesttable(rollno, firstname, lastname)
values(1, 'TOM', 'SMITH')

select rollno, firstname, lastname from mytesttable


restore database AdventureWorks from disk='D:\Programowanie X\Bazy Danych do ćwiczeń\AdventureWorksDW2016.bak'
