select hacker_id, b.name, cnt
from (select hacker_id, name, cnt,
     count(cnt) over (partition by cnt) rep,
      max(cnt) over() maxs
      from (select h.hacker_id, h.name, count(*) cnt
           from challenges c inner join hackers h
           on c.hacker_id=h.hacker_id
           group by h.hacker_id, h.name) a
      order by cnt desc, hacker_id)b
where rep=1 or cnt=maxs;
