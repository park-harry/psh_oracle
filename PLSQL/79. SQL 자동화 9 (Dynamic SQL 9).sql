직업별 입사한 년도별 토탈월급을 위와 같이 출력하는 Procedure  를 생성하세요.
CREATE OR REPLACE PROCEDURE pivot_hiredate_sal
(p_x OUT sys_refcursor) -- sys_refcursor (테이블 형태) 
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


문제 1. 부서번호별 입사한 년도별 평균월급을 출력하는 프로시져를 생성하세요.
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

문제 2. 우리반 테이블에서 성별 별, 통신사 별 평균 나이를 출력하시오. 
 select gender, 
        round(avg(decode(lower(telecom),'kt',age,null))) as kt,
        round(avg(decode(lower(telecom),'sk',age,null))) as sk,
        round(avg(decode(lower(telecom),'lg',age,null))) as lg,
        round(avg(decode(lower(telecom),'알뜰kt',age,null))) as 알뜰kt
from emp18 
group by gender;

문제 3. 위의 결과를 출력하는 프로시져를 pivot_gender_telecom으로 생성하시오.  
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