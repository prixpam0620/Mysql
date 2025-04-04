describe superstore.store;
select * from Superstore.store;
select count(*)  from superstore.store;
SET SQL_SAFE_UPDATES = 0;
delete from superstore.store 
where row_id not in (select min(row_id) from superstore.store group by order_id);



WITH min_rows AS (
    SELECT MIN(row_id) AS min_id FROM superstore.store GROUP BY order_id
)
DELETE FROM superstore.store 
WHERE row_id NOT IN (SELECT min_id FROM min_rows);
SET SQL_SAFE_UPDATES = 1;
select count(*)  from superstore.store;
Select * from superstore.store;
select * from superstore.store where order_id is NUll;
select * from superstore.store where Order_date is NUll;
select * from superstore.store where ship_date is NUll;
select * from superstore.store where customer_id is NUll;

select Customer_id, customer_name, count(Order_id) as order_count
from superstore.store
group by customer_id,customer_name
having count(order_id) >1
order by order_count desc;

selECT customer_id, customer_name, region,  COUNT(order_id) AS order_count
FROM superstore.store
GROUP BY customer_id, customer_name,region
HAVING COUNT(order_id) > 1
ORDER BY order_count DESC;

select region, count( Distinct customer_id) as customer_count
from superstore.store
group by region
order by customer_count desc;

select state, count(Distinct customer_id) AS customer_count
from superstore.store
group by state
order by customer_count desc;


select  city, count(distinct customer_id) as customer_count
from superstore.store
group by  city
order by customer_count desc;


select segment, count(distinct customer_id) as customer_count
from superstore.store
group by  segment
order by customer_count desc;

select region, round(avg(sales), 2) as avg_sale_per_customer
from superstore.store
group by region
order by avg_sale_per_customer desc;

select category, round(sum(sales) , 2) as category_wise_sales
from superstore.store
group by category
order by category_wise_sales desc;

select category, product_name, count(Order_id) as Total_order
from superstore.store
group by category, product_name
order by category, Total_order desc;

select category, sub_category, round(sum(profit),2) as total_profit
from superstore.store
group by category, sub_category
order by category asc, sum(profit) desc;

select date_format(order_date, '%y-%m') as months, round (sum(sales),2) as total_sales
from superstore.store
group by months
order by months, total_sales desc;

select Product_name, date_format(order_date, '%y-%m') as months, count(order_id) as total_count
from superstore.store
group by product_name, months
order by  total_count desc , months asc;
select count(*) as null_dates
from superstore.store
where order_date is null;

select customer_id, customer_name, round(sum(profit),2) as maxi_profit
from superstore.store
group by customer_id, customer_name
order by maxi_profit desc;

select year (order_date), round(sum(sales),2) as total_sales
from superstore.store
group by year(order_date)
order by year (order_date) desc;


SELECT region, SUM(sales) AS total_sales, SUM(profit) AS total_profit  
FROM superstore.store 
GROUP BY region  
ORDER BY total_profit DESC;

#most profitable customer
select customer_id, customer_name, round(sum(profit),2) as total_profit, 
 round(count(sales),2) as total_count, round(sum(profit) /sum(sales) * 100,2 ) as profit_margin
from superstore.store
group by customer_id, customer_name
order by total_profit desc
limit 5;


#most profitable category

select Category, sub_category, round(sum(profit),2) as total_profit, round(sum(sales),2) as total_sales, count(order_id) as order_count
from superstore.store
group by category, sub_category
order by total_profit desc
limit 5;

#most profitable region

select region, round(sum(profit),2) as total_profit, round(sum(sales),2) as total_sales, count(order_id) as order_count
from superstore.store
group by region
#having order_count >1
order by total_profit desc
limit 5;

#finding underperforming category or sub-category

select category, sub_category, round(sum(profit),2) as total_profit, round(sum(sales),2) as total_sales
from superstore.store
group by category, sub_category 
having total_profit <1
order by total_sales asc
limit 5;

#spoting seasonal sales and their performance

select date_format(order_date, '%y-%m') as month, round(sum(sales), 2) as total_sales, 
count(order_id) as sales_count
from superstore.store 
group by month
order by month ;

#yealy sales/profit are rising or declining
select date_format(order_date, '%y-%m') as year, round(sum(sales),2) AS total_sales, 
round(sum(profit),2) AS total_profit, count(order_id) As total_order
from superstore.store
group by year
order by year asc;

#repeat customers

select segment, count(distinct customer_id) as repeat_customers
from superstore.store
where customer_id in 
(select customer_id from superstore.store group by customer_id having count(order_id)>1)
group by segment
order by repeat_customers;

#Which customer segments are most profitable per sale

Select segment, round(sum(profit)/ sum(sales) * 100,2) AS profit_margin
from superstore.store
group by segment
order by profit_margin desc;

#Operation efficiency
# average shipping date (order date-ship date)

select ship_mode, round(avg(datediff (ship_date, order_date)),2) as avg_shipping_days
from superstore.store
group by ship_mode
order by avg_shipping_days;

