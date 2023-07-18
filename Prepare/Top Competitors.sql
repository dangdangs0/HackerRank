select h.hacker_id||'  '||name
from hackers h, difficulty d, challenges c, submissions s
where s.hacker_id=h.hacker_id
and s.challenge_id=c.challenge_id
and c.difficulty_level=d.difficulty_level --JOIN
and d.score=s.score
group by h.hacker_id, name
having count(*)>=2
order by count(*) desc, h.hacker_id;
