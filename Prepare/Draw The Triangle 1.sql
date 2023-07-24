select rpad('*',2*(20-level)+1,' *')
from dual
connect by level<=20
order by level;
