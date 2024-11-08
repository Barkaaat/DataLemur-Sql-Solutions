select
  cast(m.measurement_time as date) as measurement_day, 
  sum(case when t.rn%2 = 1 then m.measurement_value else 0 end) as odd_sum,
  sum(case when t.rn%2 = 1 then 0 else m.measurement_value end) as even_sum
from
  measurements m 
left join 
  (
    select 
      *,
      row_number() over(partition by cast(measurement_time as date) order by measurement_time) as rn
    from measurements
  ) as t
on m.measurement_id = t.measurement_id
group by measurement_day
order by measurement_day