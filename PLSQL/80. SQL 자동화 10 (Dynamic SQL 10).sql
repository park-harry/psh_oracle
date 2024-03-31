문제 1. 직업별, 부서위치별 토탈월급을 출력하세요.
select  e.job, sum( decode(d.loc, 'NEW YORK', e.sal, null))  as "NEW YORK",
								sum( decode(d.loc, 'DALLAS', e.sal, null))      as "DALLAS",
								sum( decode(d.loc, 'CHICAGO', e.sal, null))   as "CHICAGO",
								sum( decode(d.loc, 'BOSTON', e.sal, null))    as "BOSTON"
from  emp  e, dept  d
where  e.deptno = d.deptno
group by e.job;

- 답:
CREATE OR REPLACE PROCEDURE pivot_loc_sal
(p_x OUT sys_refcursor)
IS
l_query VARCHAR2(4000) := 'SELECT e.job';

BEGIN
FOR x IN (SELECT loc from dept ) LOOP
l_query := l_query || ', SUM(DECODE(d.loc, ''' || x.loc ||
            ''', e.sal, null)) AS "' || x.loc || '"';
END LOOP;

l_query := l_query || ' FROM emp e, dept d 
                        WHERE e.deptno = d.deptno
                        GROUP BY e.job 
                        ORDER BY e.job';

OPEN p_x FOR l_query;
END;
/

VARIABLE x REFCURSOR;
EXEC pivot_loc_sal(:x);
PRINT x;


문제 2. 아래의 SQL의 결과가 프로시져로 자동으로 생성될 수 있도록 하세요.
select   e.job, sum( decode( d.dname, 'ACCOUNTING', e.sal, null )  ) as "ACCOUNTING",
                sum( decode( d.dname, 'RESEARCH', e.sal, null )  ) as "RESEARCH",
                sum( decode( d.dname, 'SALES', e.sal, null )  ) as "SALES",
                sum( decode( d.dname, 'OPERATIONS', e.sal, null )  ) as "OPERATIONS"
from  emp  e,  dept  d
where  e.deptno = d.deptno
group  by  e.job;

- 답: 
create or replace procedure pivot_dname_sal
(p_x out sys_refcursor)
is 
l_query varchar2(2000) := 'select e.job';
begin
    for x in (select dname from dept) loop
        l_query := l_query ||', sum(decode(d.dname,'''||x.dname||''',e.sal,null)) as "' ||x.dname||'"';
    end loop;
    l_query := l_query ||' from emp e, dept d 
                           where e.deptno = d.deptno
                           group by e.job';
    open p_x for l_query;
end;
/

VARIABLE x REFCURSOR;
EXEC pivot_dname_sal(:x);
PRINT x;