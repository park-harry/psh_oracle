-- 직업, 직업별 총 월급을 출력하시오. 
select job, sum(sal) 
from emp 
group by job;

-- 위의 결과를 다시 출력하는데 직업별 총 월급이 5000 이상인 사원만 출력하시오. 
select job, sum(sal) 
from emp 
group by job
having sum(sal) >= 5000;

-- 직업과 직업별 총 월급을 출력하는데 직업별 총 월급이 직업이 salesman인 사원들의 
-- 총 월급보다 더 큰 것만 출력하시오. 
select job, sum(sal) 
from emp 
group by job
having sum(sal) > (select sum(sal) from emp where job = 'SALESMAN');

-- 통신사, 통신사 별 인원수를 출력하는데 통신사 별 인원수가 LG의 인원수보다 더 큰것만 출력하시오. 
select telecom, count(*) 
from emp18 
group by telecom 
having count(*) > (select count(*) from emp18 where telecom = 'lg');