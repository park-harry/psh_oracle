select  job,   sum( decode(deptno, 10, sal, null)  )  as  "dept10",
sum( decode(deptno, 20, sal, null)  )  as  "dept20",
sum( decode(deptno, 30, sal, null)  )  as  "dept30"
from   emp
group   by  job;

���� 1.���� SQL �� PL/SQL�� ���̳��� SQL �� �����ϰ� �����ϼ���.
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
=> x: ȣ��Ʈ ����, refcursor: ���̺� ���� ���� Ÿ�� 

exec job_deptno_sum(:x);
print x;

���� 2. ���� ��ũ��Ʈ�� �����ؼ� �Ʒ��� SQL�� ����� ����Ͻÿ�. 
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

���� 3. emp ���̺� �Ʒ��� ���� 40�� �����͸� �Է��ϰ� ���ν����� �����غ��ÿ�. 
insert into emp(empno, ename, sal, deptno)
values(8211,'aaa',4500,40);

variable  x  refcursor;
exec deptno_sum(:x);
print x;

���� 4. (SQL) ����, ������ ��Ż������ ���η� ����Ͻÿ�. 
select job, sum(sal) 
from emp 
group by job;

���� 5. (SQL) ����, ������ ��Ż������ ���η� ����Ͻÿ�. 
select  sum(decode(job,'ANALYST',sal,null)) as "ANALYST",
        sum(decode(job,'CLERK',sal,null)) as "CLERK",
        sum(decode(job,'MANAGER',sal,null)) as "MANAGER",
        sum(decode(job,'SALESMAN',sal,null)) as "SALESMAN",
        sum(decode(job,'PRESIDENT',sal,null)) as "PRESIDENT"
from emp;

- ���� ����� �ٽ� ����ϴµ� �μ���ȣ�� ������ ��Ż ������ ��µǰ� �Ͻÿ�.
select  deptno, sum(decode(job,'ANALYST',sal,null)) as "ANALYST",
                sum(decode(job,'CLERK',sal,null)) as "CLERK",
                sum(decode(job,'MANAGER',sal,null)) as "MANAGER",
                sum(decode(job,'SALESMAN',sal,null)) as "SALESMAN",
                sum(decode(job,'PRESIDENT',sal,null)) as "PRESIDENT"
from emp
group by deptno;

���� 6.���� ����� ��µ� �� �ְ� ���ν����� �����Ͻÿ�. 
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