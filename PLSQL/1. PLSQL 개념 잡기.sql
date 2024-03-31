create or replace procedure get_data(p_x out sys_refcursor)
as
l_query varchar2(400) := 'select job';
l_deptno number;
begin
for x in (select distinct deptno from emp order by 1)
loop
l_deptno := x.deptno;
l_query := l_query || ', sum(decode(deptno, ' || l_deptno || ', sal)) as "' || l_deptno || '"';
end loop;
l_query := l_query || ' from emp group by job';
open p_x for l_query;
end;
/

variable x refcursor;
exec get_data(:x);
print x;