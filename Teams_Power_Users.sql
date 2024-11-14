-- question link -- https://datalemur.com/questions/teams-power-users

select 
	sender_id,
	count(sender_id) as message_count
from messages
where 
	extract(year from sent_date) = 2022
and 
	extract(month from sent_date) = 8
group by sender_id
order by message_count desc
limit 2;