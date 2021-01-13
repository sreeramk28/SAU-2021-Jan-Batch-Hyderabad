-- Q2.
-- Write a query to retrieve the most sold product per day in a specific 
--   location (take any location) in last week.

select MAX_SALE.PRODUCT_CODE, PROD.product_name, MAX_SALE.PURCHASE_DATE, MAX_SALE.PURCHASE_COUNT   
from (
select *
from
(	
	select * 
	from ( 
		select PU.product_code as PRODUCT_CODE, PU.purchase_date as PURCHASE_DATE, sum(PU.units) as PURCHASE_COUNT
		from purchases PU
		inner join sale_locations S
		on PU.sales_exec_id = S.sales_exec_id
		where S.location_code = "L01"
		group by PU.product_code, PU.purchase_date
	) as PROD_SALES
	where PURCHASE_DATE 
	BETWEEN '2021-01-07' AND '2021-01-13'
) as PROPER_SALES
order by PURCHASE_COUNT DESC
limit 1
) as MAX_SALE
inner join product as PROD
ON MAX_SALE.PRODUCT_CODE = PROD.product_code;

-- Q3.
-- Write a query to list all the sales persons details 
--   along with the count of products sold by them (if any) till current date.
-- (solved assuming no records with dates of the future are present)
select S.sales_exec_id, S.name, S.date_born, S.gender, COUNT_OF_SALES.total_sales
from 
(
select sales_exec_id as SE_ID, sum(units) as total_sales
from purchases
group by sales_exec_id 
) as COUNT_OF_SALES
right join sales_executive as S
ON S.sales_exec_id = COUNT_OF_SALES.SE_ID;