with prime as
(
    select level+1 num
    from dual
    connect by level<1000
)
select listagg(num,'&') within group(order by num)
from prime
where not exists( select 1 from prime b
                 where prime.num!=b.num
                 and mod(prime.num, b.num)=0);
