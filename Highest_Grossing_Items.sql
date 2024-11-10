-- question link -- https://datalemur.com/questions/sql-highest-grossing

select category, product, total_spend
from (
	select 
		category, 
		product, 
		sum(spend) as total_spend, 
		dense_rank() over (partition by category order by sum(spend) desc) as ds
	from product_spend
	where extract(year from transaction_date) = 2022
	group by product, category
) as T
where T.ds < 3