-- 이름, 월급, 월급에 대한 순위를 출력하시오. 
select ename, sal, rank() over (order by sal desc) 순위 
from emp;

-- 부서 번호, 이름, 월급, 월급에 대한 순위를 출력하는데 부서번호 별로 각각 월급이 높은 
-- 순서대로 순위를 부여하시오. 
select deptno, ename, sal, rank() over (partition by deptno order by sal desc) 순위
from emp;

-- 직업, 이름, 월급, 순위를 출력하는데 순위가 직업 별로 각각 월급이 높은 사원 순으로 
-- 순위를 부여하시오. 
select job, ename, sal, rank() over (partition by job order by sal desc) 순위
from emp; 

-- 월급이 1000에서 3000 사이인 사원들의 이름, 월급, 월급에 대한 순위를 출력하시오. 
select ename, sal, rank() over (order by sal desc) 순위
from emp 
where sal between 1000 and 3000;