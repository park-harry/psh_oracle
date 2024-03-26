-- 이름과 월급, 커미션, 월급 + 커미션을 출력하시오. 
select ename, sal, comm, sal+comm
from emp;

-- 이름과 월급, 커미션을 출력하는데 커미션이 null인 사원들은 0으로 출력하시오. 
select ename, sal, nvl(comm,0)
from emp;

-- 이름, 직업을 출력하는데 직업이 null 인 사원들은 no job으로 출력하시오. 
select ename, nvl(job,'no job')
from emp;

-- (난이도 중) 이름, 월급, 커미션을 출력하는데 커미션이 NULL 인 사원들은 NO COMM이라는 
-- 글씨로 출력하시오.
select ename, sal, nvl(TO_CHAR(comm),'NO COMM')
from emp;

-- 이름, 월급, 커미션, 월급 + 커미션을 출력하시오. (nvl2)
select ename, sal, comm,nvl2(comm, sal+comm, sal)
from emp;

-- 이름, mgr을 출력하는데 mgr이 null 사원은 no manager로 출력되게 하시오. (nvl과 nvl2) 
select ename, nvl(to_char(mgr),'no manager') 
from emp;

select ename, nvl2(to_char(mgr), to_char(mgr), 'no manager') 
from emp;