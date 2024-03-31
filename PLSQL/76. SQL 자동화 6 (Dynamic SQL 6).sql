문제 1. 부서번호, 부서번호별 토탈월급을 출력하도록 SQL을 작성하세요
select deptno, sum(sal) 
from emp 
group by deptno;

문제 2. 부서번호와 부서번호별 토탈월급을 가로로 출력하도록 SQL을 작성하세요
select sum(decode(deptno,10,sal,null)) as "10",
         sum(decode(deptno,20,sal,null)) as "20",
          sum(decode(deptno,30,sal,null)) as "30"
from emp ;

문제 3. 직업과 부서번호별 토탈월급을 아래와 같이 출력되게 SQL을 작성하세요.
select job, sum(decode(deptno,10,sal,null)) as "10",
         sum(decode(deptno,20,sal,null)) as "20",
          sum(decode(deptno,30,sal,null)) as "30"
from emp 
group by job;

문제 4.부서번호별 직업별 평균월급을 가로로 출력하세요 !
select deptno, avg(decode(job,'ANALYST',sal,null)) as "ANALYST",
         avg(decode(job,'CLERK',sal,null)) as "CLERK",
         avg(decode(job,'MANAGER',sal,null)) as "MANAGER",
         avg(decode(job,'SALESMAN',sal,null)) as "SALESMAN",
         avg(decode(job,'PRESIDENT',sal,null)) as "PRESIDENT"
from emp 
group by deptno;