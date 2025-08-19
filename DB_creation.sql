create database Project_1;
use Project_1;
create table sales_data(
	transaction_id int primary key,
    sale_date date,
    sale_time time,
    customer_id int,
    gender varchar(10),
    age int,
    category varchar(20),
    quantity tinyint,
    price_per_unit int,
    cogs int,
    total_sale int);


select count(transaction_id) from sales_data;
alter table sales_data
modify cogs float;
alter table sales_data
modify price_per_unit float; 

set SQL_SAFE_UPDATES = 0;
delete from sales_data
where cogs is null or price_per_unit is null or quantity is null;

select * from sales_data
where transaction_id is null 
	or sale_date is null 
    or sale_time is null 
    or customer_id is null 
    or gender is null 
    or category is null 
    or age is null 
    or cogs is null 
    or price_per_unit is null 
    or quantity is null;


