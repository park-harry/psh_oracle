-- 사원 테이블에서 월급이 3000 이상인 사람만 출력
select ename, sal 
from emp 
where sal = 3000;

-- 사원번호가 7788번인 사원의 사원번호와 이름과 월급을 조회하시오.
select empno, ename, sal
from emp 
where empno = 7788;

-- 월급이 2000 이상인 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where sal >= 2000;

-- 월급 2500 이하인 사원들의 이름과 월급을 출력하는데 월급이 
-- 높은 사원부터 출력하시오. 
select ename, sal 
from emp 
where sal <= 2500
order by sal desc;