-- 부서번호, 부서번호 별 총 월급을 출력하는데 맨 아래에 전체 총 월급을 출력하시오. 
select deptno, sum(sal) 
from emp 
group by grouping sets(deptno,());

-- 아래의 SQL의 결과를 GROUPING SETS 로 구현하시오 
select deptno, job, sum(sal) 
from emp 
group by rollup(deptno, job) 
order by deptno, job; 

-- 답:
select deptno, job, sum(sal) 
from emp 
group by grouping sets(deptno,(deptno, job),())
order by deptno, job; 

-- 아래의 SQL의 결과를 GROUPING SETS 로 구현하시오 
select deptno, sum(sal) 
from emp 
group by cube(deptno);

-- 답:
select deptno, sum(sal) 
from emp 
group by grouping sets(deptno,())
order by deptno asc nulls first;

select empno, ename, sum(sal) 
from emp 
group by grouping sets((empno,ename),())
order by empno;

select to_char(hiredate,'rrrr'), job, sum(sal) 
from emp 
group by grouping sets(to_char(hiredate,'rrrr'), job)
order by job asc, to_char(hiredate,'rrrr') desc;