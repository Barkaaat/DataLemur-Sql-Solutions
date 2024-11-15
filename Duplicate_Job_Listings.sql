-- question link -- https://datalemur.com/questions/duplicate-job-listings

select count(*) as duplicate_companies
from (
	select count(*) as cnt, company_id, title, description
	from job_listings
	group by company_id, title, description
) as t
where t.cnt > 1;