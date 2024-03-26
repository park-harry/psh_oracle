-- 커미션이 null인 사원들의 이름과 커미션을 출력하시오. 
select ename, comm
from emp
where comm is null;

-- 아래의 수식은 출력되지 않는다. 
select ename, comm
from emp
where comm = null;
-- null 값은 알 수 없는 값이기 때문에 '='로는 비교 할 수 없다. 

-- 커미션이 null이 아닌 사원들의 이름과 커미션을 출력하시오. 
select ename, comm
from emp
where comm is not null;