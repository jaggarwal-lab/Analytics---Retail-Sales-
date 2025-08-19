use project_1;
select gender, category,
count(transaction_id), 
sum(quantity), 
sum(quantity)/count(transaction_id) as quantity_per_transaction,
round(avg(total_sale), 2) as Avg_order_value,
sum(total_sale),
sum(total_sale) - sum(cogs) as profit,
round(((sum(total_sale) - sum(cogs*quantity))*100/(select sum(total_sale) - sum(cogs*quantity) from sales_data)),2) as profit_percentage,
(sum(total_sale) - sum(cogs))/sum(quantity) as profit_per_quantity,
avg((total_sale-(quantity*cogs))*100/total_sale) as profit_margin
from sales_data
group by gender, category
order by gender, category,profit desc;


/*Gender without Ctaegory*/
select gender,
count(transaction_id), 
sum(quantity), 
sum(quantity)/count(transaction_id) as quantity_per_transaction,
round(avg(total_sale), 2) as Avg_order_value,
sum(total_sale),
sum(total_sale) - sum(cogs) as profit,
round(((sum(total_sale) - sum(cogs*quantity))*100/(select sum(total_sale) - sum(cogs*quantity) from sales_data)),2) as profit_percentage,
(sum(total_sale) - sum(cogs))/sum(quantity) as profit_per_quantity,
avg((total_sale-(quantity*cogs))/total_sale) as profit_margin
from sales_data
group by gender
order by gender,profit desc;