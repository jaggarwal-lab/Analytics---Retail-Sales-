use project_1;

select age, count(transaction_id), count(distinct customer_id)
from sales_data
group by age
order by count(transaction_id) desc;


select 
	case 
		when age between 18 and 25 then "18-25"
        when age between 25 and 40 then "25-40"
        when age between 41 and 60 then "40-60"
		else "60+"
	end as Age_group,
    count(transaction_id),
    sum(total_sale),
    avg(total_sale),
    sum(total_sale - (cogs*quantity)) as profit
from sales_data
group by Age_group
order by Age_group;



select 
	case 
		when age between 18 and 25 then "18-25"
        when age between 25 and 40 then "25-40"
        when age between 41 and 60 then "40-60"
		else "60+"
	end as Age_group,
    category,
    count(transaction_id),
    sum(total_sale),
    avg(total_sale)
from sales_data
group by Age_group,category
order by Age_group;