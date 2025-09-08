with uniqueProducts as (
	select customer_id, COUNT(distinct product_key) as uniques
	from Customer
	group by customer_id
), totProducts as (
	select count(product_key) as total 
	from Product
)
select customer_id
from uniqueProducts u, totProducts t
where u.uniques = t.total
