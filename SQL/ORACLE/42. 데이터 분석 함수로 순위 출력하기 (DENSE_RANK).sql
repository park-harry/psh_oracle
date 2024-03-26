-- 이름, 월급, 순위를 출력하는데 rank와 dense_rank의 차이점 
select ename, sal, rank() over (order by sal desc) 순위 
from emp;

select ename, sal, dense_rank() over (order by sal desc) 순위 
from emp;

-- 부서번호, 이름, 입사일, 순위를 출력하는데 순위가 부서 번호 별로 각각 먼저 입사한 
-- 사원순으로 순위를 부여하시오. 
select deptno, ename, hiredate, dense_rank() over (partition by deptno order by hiredate) 순위
from emp; 

-- 월급 1250은 사원 테이블에서 월급의 순위가 어떻게 되는가? 
select dense_rank(1250) within group (order by sal desc) 순위 
from emp;

-- 81/11/17에 입사한 사원은 몇 번째로 입사한 사원인가? 
select dense_rank('81/11/17') within group (order by hiredate) 순위 
from emp;

-- 우리반 테이블에서 성별, 이름, 나이, 순위를 출력하는데 순위가 성별 별로 각각 나이가 
-- 높은 순서대로 순위를 부여하시오. 
select gender, ename, age, dense_rank() over (partition by gender order by age desc)순위
from emp18;