select h.hacker_id, name, sum(m) total
from hackers h, (select hacker_id, challenge_id, max(score) m
                from submissions
                group by hacker_id, challenge_id) s
where h.hacker_id=s.hacker_id
group by h.hacker_id, name
having sum(m)>0
order by total desc, hacker_id;
