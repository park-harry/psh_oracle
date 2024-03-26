-- (복습문제) 이름, 월급, 사원 테이블의 총 월급을 출력하시오. 
select ename, sal, sum(sal) over() as 토탈
from emp; 

-- 위의 결과를 select 절의 서브쿼리인 스칼라 서브쿼리로 수행하시오. 
select ename, sal, 
(select sum(sal) from emp) as 토탈
from emp; 

-- 이름, 월급, 직업이 salesman인 사원들의 총 월급을 출력하시오. 
select ename, sal, 
(select sum(sal) from emp where job = 'SALESMAN') as 토탈
from emp; 

-- 이름, 성별, 나이, 우리반 테이블의 평균 나이를 출력하시오. 
select ename, gender, age, (select round(avg(age)) from emp18) as 평균나이 
from emp18;

-- 이름, 월급, 직업이 salesman인 토탈월급, 직업이 salesman인 사원들의 최대월급, 
-- 직업이 salesman인 최소 월급을 출력하시오. 
select ename, sal, 
(select sum(sal) from emp where job = 'SALESMAN') AS 토탈월급, 
(select max(sal) from emp where job = 'SALESMAN') AS 최대월급, 
(select min(sal) from emp where job = 'SALESMAN') AS 최소월급
from emp;

-- (힌트 문제) 직업이 salesman인 토탈월급, 최대월급, 최소월급을 출력하시오. 
select sum(sal), max(sal), min(sal)
from emp where job = 'SALESMAN';

-- 아래와 같이 SQLP 주관식 문제를 수정해서 작성하시오. 
select ename, sal, 
(select sum(sal) ||',' || max(sal) ||',' ||min(sal) 
from emp where job = 'SALESMAN') 
from emp;

select ename,sal, 
    substr(total,1,4) as sumsal,
    substr(total,6,4) as maxsal,
    substr(total,11,4)as minsal
from 
    (select ename, sal, 
    (select sum(sal) ||',' || max(sal) ||',' ||min(sal) 
    from emp where job = 'SALESMAN') as total
    from emp);