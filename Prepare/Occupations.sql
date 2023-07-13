select doctor,professor,singer,actor
from (select name, occupation, row_number() over(partition by occupation order by name) rn
     from occupations) --occupation별로 알파벳 오름차순으로 등수를 매김
pivot (
    min(name)
    for occupation in ('Doctor' doctor,'Professor' professor,'Singer' singer,'Actor' actor)
)
order by doctor,professor,singer,actor;
