select city
from station
where regexp_like(lower(city),'^[aeiou]')
and regexp_like(lower(city),'[aeiou]$');
-- ^ : 해당 문자로 시작하는 것 표시
-- $ : 해당 문자로 끝나는 것 표시
