use project_1;
select 
extract(year from sale_date) as saleyear,
case
	when extract(month from sale_date) between 1 and 3 then "First quater"
    when extract(month from sale_date) between 4 and 6 then "Second Quater"
    when extract(month from sale_date) between 7 and 9 then "Third Quater"
    else "Fourth Quater"
end as Quater,
gender,
count(transaction_id)
from sales_data
group by saleyear, Quater,gender
order by saleyear, Quater;


/*Including Gender*/
select gender,
case
	when extract(month from sale_date) between 1 and 3 then "First quater"
    when extract(month from sale_date) between 4 and 6 then "Second Quater"
    when extract(month from sale_date) between 7 and 9 then "Third Quater"
    else "Fourth Quater"
end as Quater,
count(transaction_id)
from sales_data
group by gender,Quater
order by gender;



select
	case
	when extract(month from sale_date) between 1 and 3 then "First quater"
    when extract(month from sale_date) between 4 and 6 then "Second Quater"
    when extract(month from sale_date) between 7 and 9 then "Third Quater"
    else "Fourth Quater"
end as Quater,
	case 
		when extract(hour from sale_time) <12 then "Morning"
		when extract(hour from sale_time) between 12 and 17 then "Afternoon"
		else "Evening"
	end as shift,
    count(transaction_id), 
    sum(total_sale), 
    count(transaction_id)*100/(select count(transaction_id) from sales_data) as percentage
from sales_data
group by Quater, shift
order by Quater, shift;
