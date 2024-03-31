������ �Ի��� �⵵�� ��Ż������ ���� ���� ����ϴ� Procedure  �� �����ϼ���.
CREATE OR REPLACE PROCEDURE pivot_hiredate_sal
(p_x OUT sys_refcursor) -- sys_refcursor (���̺� ����) 
IS
l_query VARCHAR2(2000) := 'SELECT job';

BEGIN
    FOR year IN (SELECT DISTINCT TO_CHAR(hiredate, 'RRRR') AS hire_year 
                FROM emp 
                ORDER BY hire_year) LOOP
    l_query := l_query || ', SUM(DECODE(TO_CHAR(hiredate, ''RRRR''), ''' || year.hire_year
                             || ''', sal, NULL)) AS "' || year.hire_year || '"';
    END LOOP;
    
    l_query := l_query || ' FROM emp GROUP BY job ';
    
    OPEN p_x FOR l_query;
END;
/

VARIABLE x REFCURSOR;
EXEC pivot_hiredate_sal(:x);
PRINT x;


���� 1. �μ���ȣ�� �Ի��� �⵵�� ��տ����� ����ϴ� ���ν����� �����ϼ���.
CREATE OR REPLACE PROCEDURE deptno_hiredate_sal
(p_x OUT sys_refcursor) 
IS
l_query VARCHAR2(2000) := 'SELECT deptno';

BEGIN
    FOR year IN (SELECT DISTINCT TO_CHAR(hiredate, 'RRRR') AS hire_year 
                FROM emp 
                ORDER BY hire_year) LOOP
    l_query := l_query || ', round(avg(DECODE(TO_CHAR(hiredate, ''RRRR''), ''' || year.hire_year
                             || ''', sal, NULL))) AS "' || year.hire_year || '"';
    END LOOP;
    
    l_query := l_query || ' FROM emp GROUP BY deptno order by deptno';
    
    OPEN p_x FOR l_query;
END;
/

VARIABLE x REFCURSOR;
EXEC deptno_hiredate_sal(:x);
PRINT x;

���� 2. �츮�� ���̺��� ���� ��, ��Ż� �� ��� ���̸� ����Ͻÿ�. 
 select gender, 
        round(avg(decode(lower(telecom),'kt',age,null))) as kt,
        round(avg(decode(lower(telecom),'sk',age,null))) as sk,
        round(avg(decode(lower(telecom),'lg',age,null))) as lg,
        round(avg(decode(lower(telecom),'�˶�kt',age,null))) as �˶�kt
from emp18 
group by gender;

���� 3. ���� ����� ����ϴ� ���ν����� pivot_gender_telecom���� �����Ͻÿ�.  
create or replace procedure pivot_gender_telecom
(p_x out sys_refcursor) 
is 
l_query varchar2(2000) := 'select gender';
begin
    for t in (select distinct telecom
                from emp18
                order by telecom) loop
        l_query:= l_query||',round(avg(decode(telecom, '''||t.telecom||
                ''',age,null))) as '||t.telecom;
    end loop;   
    
    l_query := l_query ||' from emp18 group by gender';
    open p_x for l_query;
end;
/

VARIABLE x REFCURSOR;
EXEC pivot_gender_telecom(:x);
PRINT x;