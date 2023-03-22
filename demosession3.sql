create database demosession3
go
use demosession3
1-1 /* một chiều, một dòng dữ lệu của a tg dg với 
dòng dư liệu của b và ngược lại */
A table - B table
Student table - StudentInfo table
Nguyen van C - st01
Nguyen van D - st02
1-N /*một chiều, một dòng dữ liệu của a tg dg
vs nhiều dòng dư liệu của n và ngược lại */
A table - B table
Khoa table - SinhVien table
DanhMuc table - SanPham table
N - N /  /*nhiều dòng dữ liệu của n tg dg
vs nhiều dòng dư liệu của n và ngược lại */
A table              -         B table
 id primary key

								A_ID khoa ngoai

SinhVien table - MonHoc table
TaiKhoan - Quyen
drop table faculty 
drop table student

create table category (
	id varchar primary key identity (1,1),
	name varchar (250),
)

create table product (
	id varchar (10)  ,
	name varchar (250),
	price float,
	quantity int,
	created date,
	category_id int references category(id)
)
drop table category
drop table product

create table category (
	id varchar(10) not null primary key,
	name varchar (250),
)
create table product (
	id int not null primary key identity (1,1)  ,
	name varchar (250),
	price float,
	quantity int,
	created date,
	category_id varchar(10) references category(id)
)

/*----------------------------------------------*/
use demosession3
go
create table Faculty (
	id int not null primary key identity (1,1),
	name varchar (250)
	)
create table Student  ( 
	id int not null primary key identity (1,1),
	name varchar (250),
	dob date,
	score float,
	Faculty_id int references faculty(id)
	)
insert into Faculty values ('sinhHoc')
insert into Faculty values ('vatLy')
insert into Faculty values ('hoaHoc')
select *
from faculty 
go
insert into Student values ('name 1', '1980-10-05',6.8,1)
insert into Student values ('name 2', '1980-10-05',7,3,1)
insert into Student values ('name 3', '1980-10-05',2.5 ,1)

select *
from faculty, student
where faculty.id = student.faculty_id
/*câu rút gọn */
select s.id, s.name, score
from faculty f/*chứa tên*/, student s
where f.id = s.faculty_id
/*1/Liet ke cac sinh vien dang hoc khoa co ten la Hoa Hoc*/
select s.*
from faculty f, student s
where f.id = s.faculty_id and f.name = 'hoahoc'
/*2/Dem co bao nhieu sinh vien đang hoc khoa Hoa Hoc va Vat Ly*/
select count(*)
from faculty f, student s
where f.id = s.faculty_id and f.name in('hoa hoc', 'vat ly')
go
select count(*)
from faculty f, student s
where f.id = s.faculty_id and (f.name = 'hoa hoc' or f.name = 'vat ly')
go
/*3Tim diem lon nhat cua sinh vien dang hoc khoa Sinh Hoc*/
select max(s.score)
from faculty f, student s
where f.id = s.faculty_id and f.name ='sinhhoc'

/*4 Liet ke cac sinh vien co tuoi lon hon 25 dang hoc trong khoa Vat Ly hoac Sinh Hoc*/
select s. *
from faculty f, student s
where f.id = s.faculty_id and f.name in ('sinhhoc', 'vatlly')
and year(GETDATE()) - YEAR(s.dob) >=25
/* 5. Liet ke n sinh vien co diem so lon nhat dang hoc trong 2 khoa Vat Ly hoac Sinh Hoc */
select top 2 s.*
from Faculty f, Student s
where f.id = s.faculty_id and f.name in ('SinhHoc', 'VatLy') 
order by s.score desc