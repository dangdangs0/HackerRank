select s.name
from friends f inner join students s on f.id=s.id
inner join packages p on p.id=s.id
inner join packages fp on fp.id=f.friend_id
where fp.salary>p.salary
order by fp.salary;
