-- question link -- https://datalemur.com/questions/sql-top-three-salaries

with emp as (
	select *, dense_rank() over(partition by department_id order by salary desc) as "dr"
	from employee
	order by salary desc
)

select
	d.department_name,
	e.name,
	e.salary
from 
	emp e
right join
	department d
on d.department_id = e.department_id
where e.dr < 4
order by d.department_name, e.salary desc, e.name;