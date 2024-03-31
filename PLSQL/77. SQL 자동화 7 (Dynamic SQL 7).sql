select  job,   sum( decode(deptno, 10, sal, null)  )  as  "dept10",
sum( decode(deptno, 20, sal, null)  )  as  "dept20",
sum( decode(deptno, 30, sal, null)  )  as  "dept30"
from   emp
group   by  job;

문제 1.위의 SQL 을 PL/SQL의 다이나믹 SQL 로 구현하고 실행하세요.
CREATE OR REPLACE PROCEDURE  job_deptno_sum
(p_x OUT sys_refcursor )
IS
l_query VARCHAR2(400) := 'SELECT job ';
BEGIN
    FOR x IN ( SELECT DISTINCT deptno FROM emp order by deptno ) LOOP
        l_query := l_query || ', SUM(DECODE(deptno, ' 
                    || x.deptno || ',sal, null )) as dept'|| x.deptno;
    END LOOP;
    
    l_query := l_query || ' FROM emp GROUP BY job ';
    
    OPEN p_x FOR l_query;
end;
/

variable  x  refcursor;
=> x: 호스트 변수, refcursor: 테이블 형태 변수 타입 

exec job_deptno_sum(:x);
print x;

문제 2. 위의 스크립트를 수정해서 아래의 SQL의 결과를 출력하시오. 
select sum( decode(deptno, 10, sal, null)  )  as  "dept10",
sum( decode(deptno, 20, sal, null)  )  as  "dept20",
sum( decode(deptno, 30, sal, null)  )  as  "dept30"
from   emp;

set serveroutput on 
CREATE OR REPLACE PROCEDURE  deptno_sum
(p_x OUT sys_refcursor )
IS
l_query VARCHAR2(400) := 'SELECT ';
BEGIN
    FOR x IN ( SELECT DISTINCT deptno FROM emp order by deptno ) LOOP
        l_query := l_query || ' SUM(DECODE(deptno, ' 
                    || x.deptno || ',sal, null )) as dept'|| x.deptno||',';
    END LOOP;
    
    l_query := rtrim(l_query,',');
    l_query := l_query || ' FROM emp ';
    dbms_output.put_line(l_query);
    OPEN p_x FOR l_query;
end;
/

variable  x  refcursor;
exec deptno_sum(:x);
print x;

문제 3. emp 테이블에 아래와 같이 40번 데이터를 입력하고 프로시져를 수행해보시오. 
insert into emp(empno, ename, sal, deptno)
values(8211,'aaa',4500,40);

variable  x  refcursor;
exec deptno_sum(:x);
print x;

문제 4. (SQL) 직업, 직업별 토탈월급을 세로로 출력하시오. 
select job, sum(sal) 
from emp 
group by job;

문제 5. (SQL) 직업, 직업별 토탈월급을 가로로 출력하시오. 
select  sum(decode(job,'ANALYST',sal,null)) as "ANALYST",
        sum(decode(job,'CLERK',sal,null)) as "CLERK",
        sum(decode(job,'MANAGER',sal,null)) as "MANAGER",
        sum(decode(job,'SALESMAN',sal,null)) as "SALESMAN",
        sum(decode(job,'PRESIDENT',sal,null)) as "PRESIDENT"
from emp;

- 위의 결과를 다시 출력하는데 부서번호별 직업별 토탈 월급을 출력되게 하시오.
select  deptno, sum(decode(job,'ANALYST',sal,null)) as "ANALYST",
                sum(decode(job,'CLERK',sal,null)) as "CLERK",
                sum(decode(job,'MANAGER',sal,null)) as "MANAGER",
                sum(decode(job,'SALESMAN',sal,null)) as "SALESMAN",
                sum(decode(job,'PRESIDENT',sal,null)) as "PRESIDENT"
from emp
group by deptno;

문제 6.위의 결과가 출력될 수 있게 프로시져를 생성하시오. 
set serveroutput on 
create or replace procedure deptno_job_sumsal
(p_x out sys_refcursor)
is 
l_query varchar2(400) := 'select deptno ';
begin
    for x in (select distinct job from emp order by job) loop
        l_query := l_query || ',sum(decode(job,'''||x.job||''',sal,null)) as '||x.job;
    end loop;
    
    l_query := l_query || ' from emp group by deptno';
    open p_x for l_query;
end;
/

variable  x  refcursor;
exec deptno_job_sumsal(:x);
print x;