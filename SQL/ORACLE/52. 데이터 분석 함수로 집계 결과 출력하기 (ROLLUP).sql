-- 부서번호, 부서번호 별 총 월급을 출력하시오. 
select deptno, sum(sal) 
from emp 
group by deptno;

--  부서번호, 부서번호 별 총 월급을 출력하는데, 부서번호별 총 월급에 대한 전체 합계가
-- 맨 아래에 출력되게 하시오. 
select deptno, sum(sal) 
from emp 
group by rollup(deptno);

-- 통신사 뽑고, 통신사 별 인원수를 출력하는데 맨 아래에 전체 인원수가 출력되게 하시오.
select telecom, count(*)  
from emp18
group by rollup(telecom); 

-- 위의 결과에 rollup 옆에 total 이라고 쓰시오. 
select nvl(telecom,'total') as telecom, count(*)  
from emp18
group by rollup(telecom); 

-- 직업, 직업별 총 월급을 출력하는데 맨 아래에 전체 총 월급이 나오고 옆에 '전체 집계'라고 나오게 하시오. 
select nvl(job,'전체 집계'), sum(sal) 
from emp 
group by rollup(job); 

-- 입사한 년도(4자리), 입사한 년도별 총 월급을 출력하는데 맨 아래에 전체 총 월급도 출력하시오. 
select nvl(to_char(hiredate, 'rrrr'),'total') as 입사년도, sum(sal) 
from emp 
group by rollup(to_char(hiredate, 'rrrr'));

-- 부서번호, 직업, 부서번호별 직업별 총 월급을 출력하시오. 
select deptno, job, sum(sal) 
from emp 
group by deptno, job
order by deptno, job;

-- 위의 결과를 다시 출력하는데 ROLLUP을 써서 출력하시오. 
select deptno, job, sum(sal) 
from emp 
group by rollup(deptno, job)
order by deptno;

-- 우리 반 테이블에서 성별, 통신사, 평균 나이를 출력하는데 rollup을 이용하여 아래의 
-- 3가지 그룹핑된 결과 집합이 출력되게 하시오. 
-- 출력되는 결과: 
-- 1. gender, telecom 
-- 2. gender 
-- 3. 전체  
select gender, telecom, round(avg(age),2) 
from emp18
group by rollup(gender,telecom)
order by gender, telecom;

--위의 결과를 다시 출력하는데 null 자리를 모두 채우시오. 
select gender, 
case when gender is null then '전체토탈' 
else nvl(telecom,'토탈') end as 통신사, 
round(avg(age),2) as 평균나이
from emp18
group by rollup(gender,telecom)
order by gender, telecom;

-- 년도를 가로로 출력, 직업을 세로로 출력하고 직업별 합계, 년도별 합계, 그리고 총 합계를 구현하시오. (rollup 사용) 
select nvl(job,'합계') as job, 
nvl(sum(decode(to_char(hiredate,'rrrr'),'1980',sal)),0) as "1980",
nvl(sum(decode(to_char(hiredate,'rrrr'),'1981',sal)),0) as "1981",
nvl(sum(decode(to_char(hiredate,'rrrr'),'1982',sal)),0) as "1982",
nvl(sum(decode(to_char(hiredate,'rrrr'),'1983',sal)),0) as "1983",
sum(sal)
from emp 
group by rollup(job)
order by job;