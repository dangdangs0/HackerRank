select name, grade, students.marks
from students,grades
where students.marks between min_mark and max_mark
and grade>=8
order by grade desc, name;

select 'NULL', grade, students.marks mark
from students,grades
where students.marks between min_mark and max_mark
and grade<8
order by grade desc, mark;
