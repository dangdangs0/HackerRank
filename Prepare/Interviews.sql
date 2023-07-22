select a.contest_id, hacker_id, name,sum(s.ts),sum(s.ta),sum(v.tv),sum(v.tu)
from contests a, colleges b, challenges c,
    (select challenge_id,  sum(total_views) tv, sum(total_unique_views) tu
     from view_stats
     group by challenge_id) v,
    (select challenge_id, sum(total_submissions) ts , sum(total_accepted_submissions) ta
     from submission_stats
     group by challenge_id) s
where a.contest_id=b.contest_id
and b.college_id=c.college_id
and c.challenge_id=v.challenge_id(+)
and c.challenge_id=s.challenge_id(+)--JOIN
group by a.contest_id, hacker_id, name
having sum(s.ts)>0 or sum(s.ta)>0 or sum(v.tv)>0 or sum(v.tu)>0
order by a.contest_id;
