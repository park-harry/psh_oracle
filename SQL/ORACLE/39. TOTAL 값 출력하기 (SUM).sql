-- 사원 테이블의 월급의 총 값을 구하시오. 
select sum(sal) 
from emp;

-- 직업과 직업별 총 월급을 출력하시오. 
select job, sum(sal) 
from emp 
group by job;

-- 위의 결과를 다시 출력하는데 직업을 abcd 순서대로 정렬해서 출력하시오. 
select job, sum(sal) 
from emp 
group by job
order by job;

--위의 결과를 다시 출력하는데 직업이 salesman 제외하고 출력하시오. 
select job, sum(sal) 
from emp 
where job <> 'SALESMAN'
group by job
order by job;

--위의 결과를 다시 출력하는데 직업별 총 월급이 5000 이상인 것만 출력하시오. 
select job, sum(sal) 
from emp 
where job <> 'SALESMAN'
group by job
having sum(sal) >= 5000
order by job;
--> 그룹 함수로 조건을 줄 때는 having 절을 사용해야 한다. 

-- 입사한 년도 출력 (4자리로), 그리고 년도별 총 월급을 출력하시오. 
select to_char(hiredate,'rrrr'), sum(sal)
from emp
group by to_char(hiredate,'rrrr');

-- 위의 결과를 다시 출력하는데 입사한 년도가 1980년은 제외하고 출력하시오. 
select to_char(hiredate,'rrrr'), sum(sal)
from emp
where to_char(hiredate,'rrrr') <>'1980'
group by to_char(hiredate,'rrrr');

-- 위의 결과를 다시 출력하는데 입사한 년도별 총 월급이 4000 이상인 것만 출력하시오. 
select to_char(hiredate,'rrrr'), sum(sal)
from emp
where to_char(hiredate,'rrrr') <>'1980'
group by to_char(hiredate,'rrrr')
having sum(sal) >=4000;

-- 위의 결과를 다시 출력하는데 입사한 년도별 총 월급이 높은 것부터 출력하시오. 
select to_char(hiredate,'rrrr') as 입사년도, sum(sal) as 총월급
from emp
where to_char(hiredate,'rrrr') <>'1980'
group by to_char(hiredate,'rrrr')
having sum(sal) >=4000
order by 총월급 desc;