-- 이름, 월급, 보너스를 출력하는데 월급이 3000 이상이면 보너스를 9000, 월급이 1000 이상이고 
-- 3000 보다 작으면 보너스를 2000, 나머지는 0
select ename, sal, 
case when sal >= 3000 then 9000
    when sal between 1000 and 3000 then 2000 
    else 0 end as bonus 
from emp;

-- 이름, 부서번호, 보너스를 출력하는데 보너스가 부서번호 10이면 9000, 부서번호 20이면 6000,
-- 나머지 부서번호는 0을 출력하시오. (case 문 사용) 
select ename, deptno, 
case when deptno=10 then 9000
    when deptno=20 then 6000
    else 0 end as bonus 
from emp;

-- 이름, 커미션, 보너스를 출력하는데 커미션이 null 이면 보너스를 7000, 커미션이 null 이 아니면 
-- 보너스를 5000을 출력하시오. 
select ename, comm, 
case when comm is null then 7000
    else 5000 end as bonus 
from emp;

-- 이름과 커미션을 출력하는데 커미션이 높은 사원부터 낮은 사원순으로 출력하시오. 
select ename, comm 
from emp 
order by comm desc; --> desc만 써서 null 값들이 위로 올라온다. 

-- 위의 결과를 다시 출력하는데 null 값을 아래로 보내시오. 
select ename, comm 
from emp 
order by comm desc nulls last;

-- 이름, 관리자 번호 (mgr)을 출력하는데 mgr이 높은 값부터 출력되게 하고 null 을 맨 아래로
-- 출력하시오. 
select ename, mgr 
from emp 
order by mgr desc nulls last;