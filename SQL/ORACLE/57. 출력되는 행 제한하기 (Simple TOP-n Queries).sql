-- 사원 테이블에서 이름과 월급을 출력하는데 월급이 높은 사원부터 출력하고 출력된 결과에서 
-- 두번째 행까지 출력하시오. 
select ename, sal 
from emp 
order by sal desc fetch first 2 rows only;

-- 부서번호가 20번인 사원들의 이름, 입사일을 출력하는데 최근에 입사한 사원부터 출력하고 
-- 위의 3줄의 행만 출력하시오.
select ename, hiredate 
from emp 
where deptno = 20 
order by hiredate desc fetch first 3 rows only;