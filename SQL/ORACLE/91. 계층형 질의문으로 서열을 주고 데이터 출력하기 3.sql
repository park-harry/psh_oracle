-- 사원 테이블 전체의 서열을 출력하시오. 
select rpad(' ', level*3) || ename as employee, level, sal 
from emp
start with mgr is null 
connect by prior empno = mgr;

-- 위의 결과를 다시 출력하는데 월급이 높은 순서부터 출력하시오. 
select rpad(' ', level*3) || ename as employee, level, sal 
from emp
start with mgr is null 
connect by prior empno = mgr
order by sal desc;

-- 다시 위의 결과를 출력하는데 서열의 틀을 잘 유지하면서 출력하시오. 
select rpad(' ', level*3) || ename as employee, level, sal 
from emp
start with mgr is null 
connect by prior empno = mgr
order siblings by sal desc;

-- 위의 결과를 다시 출력하는데 이번에는 이름, level, 입사일을 출력하고 최근에 입사한 사원 순으로
-- 출력하되, 서열의 틀을 깨뜨리지 마시오. 
select rpad(' ', level*3) || ename as employee, level, hiredate 
from emp
start with mgr is null 
connect by prior empno = mgr
order siblings by hiredate desc;

