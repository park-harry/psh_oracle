select trunc(787.67,-2)
from dual;

-- 사원 테이블에서 이름과 월급을 출력하는데 십자리를 포함해서 이후를 다 지우고 출력하시오. 
select ename, sal ,trunc(sal,-2)
from emp;