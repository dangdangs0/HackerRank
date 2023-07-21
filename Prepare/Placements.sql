select s.name
from (select students.id, name, salary
     from students, packages
     where students.id=packages.id) s,
     (select friends.id,friend_id, salary
     from friends, packages
     where friend_id=packages.id) f
where s.id=f.id
and s.salary<f.salary
order by f.salary;
