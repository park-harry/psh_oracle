-- 부서번호가 10,20번 사원들의 부서번호, 부서번호 별 총 월급을 출력하시오. 
select deptno, sum(sal) 
from emp 
where deptno in (10,20)
group by deptno;

-- 부서번호가 20,30번인 사원들의 부서번호, 부서번호 별 총 월급을 출력하시오. 
select deptno, sum(sal) 
from emp 
where deptno in (20,30)
group by deptno;

-- 위의 2개 결과를 하나로 합쳐서 출력하시오. 
select deptno, sum(sal) 
from emp 
where deptno in (10,20)
group by deptno
union 
select deptno, sum(sal) 
from emp 
where deptno in (20,30)
group by deptno; 

-- 아래의 SQL의 결과를 union all 또는 union으로 구현하시오. 
select job, deptno, sum(sal) 
from emp 
group by grouping sets(job,deptno);

select to_char(null) as job, deptno, sum(sal) 
from emp 
group by deptno 
union 
select job, to_number(null) as deptno, sum(sal) 
from emp 
group by job;

-- 아래의 SQL의 결과를 union all 또는 union으로 구현하시오. 
select empno, ename, sum(sal) 
from emp 
group by grouping sets((empno, ename),());

select empno, ename, sum(sal) 
from emp 
group by empno, ename 
union 
select to_number(null), to_char(null), sum(sal) 
from emp;