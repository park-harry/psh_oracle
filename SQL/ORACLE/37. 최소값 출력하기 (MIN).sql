-- 사원 테이블에서 최소 월급을 출력하시오. 
select min(sal) 
from emp;

-- 직업, 직업별 최소월급을 출력하는데 직업별 최소 월급이 높은 것부터 출력하시오.
select job, min(sal) 
from emp 
group by job 
order by min(sal) desc;

-- 성별, 성별 별 최소 나이를 출력하시오. 
select gender, min(age) 
from emp18 
group by gender;

-- 부서번호, 부서번호 별 최소 월급을 출력하는데 부서 번호가 10번, 20번만 출력되게 하시오. 
select deptno, min(sal) 
from emp 
where deptno in (10,20)
group by deptno;

-- 우리반 테이블에서 성 을 출력하고 성씨 별 최소 나이를 출력하시오. 
select substr(ename,1,1) as 성씨, min(age) 
from emp18 
group by substr(ename,1,1);