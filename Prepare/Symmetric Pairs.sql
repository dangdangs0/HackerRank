select distinct a.x, a.y
from functions a, functions b
where a.x=b.y
and a.y=b.x
and a.x<=a.y
and a.rowid!=b.rowid
order by a.x;
