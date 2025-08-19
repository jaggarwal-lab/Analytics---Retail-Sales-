use project_1;
SELECT 
    EXTRACT(YEAR FROM sale_date) AS sale_year,
    EXTRACT(MONTH FROM sale_date) AS sale_month,
    SUM(total_sale) AS total_sales,
    sum(total_sale)-sum(quantity*cogs) as profit
FROM sales_data
GROUP BY sale_year, sale_month
ORDER BY sale_year, total_sales desc;


select gender,
	case 
		when extract(hour from sale_time) <12 then "Morning"
		when extract(hour from sale_time) between 12 and 17 then "Afternoon"
		else "Evening"
	end as shift,
    count(transaction_id), 
    sum(total_sale), 
    count(transaction_id)*100/(select count(transaction_id) from sales_data) as percentage
from sales_data
group by gender, shift
order by gender, shift;
