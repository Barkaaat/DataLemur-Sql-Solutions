-- question link -- https://datalemur.com/questions/frequent-callers

select count(cnt) from (
	select count(policy_holder_id) as cnt from callers group by policy_holder_id
) as t
where t.cnt > 2;