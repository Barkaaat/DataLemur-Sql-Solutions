-- question link -- https://datalemur.com/questions/alibaba-compressed-mode

with t (mx) as (
	select max(order_occurrences) from items_per_order
)
select item_count from items_per_order, t where order_occurrences = t.mx order by item_count;