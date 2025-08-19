use project_1;
select count(transaction_id),
count(distinct customer_id), 
sum(total_sale), 
sum(quantity), 
sum(quantity * cogs),
sum(total_sale)- sum(quantity * cogs) as profit,
avg(total_sale),
(sum(total_sale)- sum(quantity * cogs))*100/sum(Total_sale) as profit_percent
from sales_data;

select extract(year from sale_date) as Year,
count(transaction_id),
count(distinct customer_id), 
sum(total_sale), 
sum(quantity), 
sum(quantity * cogs),
sum(total_sale)- sum(quantity * cogs) as profit,
avg(total_sale),
(sum(total_sale)- sum(quantity * cogs))*100/sum(Total_sale) as profit_percent
from sales_data
group by Year;

select  customer_id, count(customer_id) as repetetion
from sales_data
group by customer_id
order by repetetion desc;
