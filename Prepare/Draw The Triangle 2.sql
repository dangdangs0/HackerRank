select rpad('*',level*2-1,' *')
from dual
connect by level<=20;
