/* tao database */
create database demosession1
go
/* xoa database */

go
/* chon database */
use demosession1
go
/* tao table */
create table Student(
	id int primary key,
	fullName varchar (100),
	description text,
	age int,
	score float,
	dob date, 
	status bit
	)
go
/* xoa table */
drop table Student
go
/* them du lieu cho table Student */
insert into Student values(1, 'Name 1', 'description 1', 20,  6.7, '2002-10-20', 1)
go
insert into Student values(2, 'Name 1', 'description 1', 20,  6.7, '2003-11-5', 1)
go
create table product(
	id int primary key,
	name varchar (250),
	price float,
	quantity int,
	created date,
	status bit
	)
	go
	insert into product values(1, 'cong', 10, 5,'2023-2-18',1)
	go
	insert into product values(2, 'ha', 10, 5,'2023-2-18',1)
	go
	insert into product values(3, 'heo', 10, 5,'2023-2-18',1)
	go
	/* xoa cot trong table product */
	alter table product
	drop column status
	go
	/* them cot moi vao table product */
	alter table product
	add status bit
	go
	/* update cot status */
	alter table product
	alter column name varchar (350)