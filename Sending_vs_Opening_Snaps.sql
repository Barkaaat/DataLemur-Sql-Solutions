-- question link -- https://datalemur.com/questions/time-spent-snaps
select 
  ag.age_bucket,
  round((sum(case when ac.activity_type = 'send' then time_spent*1.0 else 0.0 end)/sum(case when ac.activity_type != 'chat' then time_spent*1.0 else 0.0 end))*100.0, 2) as send_perc,
  round((sum(case when ac.activity_type = 'open' then time_spent*1.0 else 0.0 end)/sum(case when ac.activity_type != 'chat' then time_spent*1.0 else 0.0 end))*100.0, 2) as open_perc
from
  activities ac
join
  age_breakdown ag
on 
  ag.user_id = ac.user_id
group by 
  ag.age_bucket;
