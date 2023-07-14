select n||' '||
    case when p is null then 'Root'
    when connect_by_isleaf=1 then 'Leaf'
    else 'Inner' end 
from bst
start with p is null
connect by prior n=p
order by n;
