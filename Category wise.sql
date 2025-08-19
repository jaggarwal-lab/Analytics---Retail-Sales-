/*2. Total number of transactions, total sales and total quantity sold by category*/
use project_1;
select category, gender,
count(transaction_id), 
sum(quantity), 
sum(quantity)/count(transaction_id) as quantity_per_transaction,
round(avg(total_sale), 2) as Avg_order_value,
sum(total_sale),
sum(total_sale) - sum(cogs*quantity) as profit,
avg(total_sale - (cogs*quantity)) as profit_per_quantity
from sales_data
group by category, gender
order by gender,category;
select category, sum(total_sale) - sum(cogs) as profit from sales_data;


/*profit margin*/
select category,
count(transaction_id), 
sum(quantity), 
sum(quantity)/count(transaction_id) as quantity_per_transaction,
round(avg(total_sale), 2) as Avg_order_value,
sum(total_sale),
sum(total_sale) - sum(cogs*quantity) as profit,
avg(total_sale - (cogs*quantity)) as profit_per_quantity,
avg((total_sale - (cogs*quantity))*100/total_sale) as profit_margin
from sales_data
group by category
order by category, profit desc;