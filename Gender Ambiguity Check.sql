use project_1;
select gender, count(distinct customer_id)
from sales_data
group by gender;

select *
from sales_data as a
join sales_data as b
on a.customer_id = b.customer_id
where a.gender != b.gender; 