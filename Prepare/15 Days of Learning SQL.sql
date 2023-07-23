select g.submission_date,cnt, hi, name
from
(SELECT SUBMISSION_DATE
     , COUNT(DISTINCT HACKER_ID) CNT
  FROM SUBMISSIONS S
 WHERE (SELECT COUNT(DISTINCT SUBMISSION_DATE)
          FROM SUBMISSIONS SS
         WHERE SS.SUBMISSION_DATE < S.SUBMISSION_DATE
           AND SS.HACKER_ID = S.HACKER_ID
       ) = (S.SUBMISSION_DATE - TO_DATE('2016-03-01'))
 GROUP BY SUBMISSION_DATE) g,
( select a.submission_date,hc,a.hacker_id,h.name,
    min(a.hacker_id) over (partition by a.submission_date) hi
    from
        (select submission_date,hacker_id, count(*) hc
        from submissions
        group by submission_date, hacker_id) a,
        (select submission_date, max(cnt) m
        from (select hacker_id, submission_date,count(*) cnt
              from submissions
              group by submission_date, hacker_id
              order by submission_date, cnt desc, hacker_id)
        group by submission_date) b,
        (select hacker_id, name
        from hackers)h
    where a.hc=b.m
    and a.submission_date=b.submission_date
    and h.hacker_id= a.hacker_id
    order by submission_date, a.hacker_id) gg
where hi=hacker_id
and g.submission_date=gg.submission_date ;
