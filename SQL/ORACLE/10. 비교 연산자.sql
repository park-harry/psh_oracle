-- 우리반 테이블에서 성별이 남자인 학생들의 모든 컬럼의 데이터를 출력하시오. 
select * from emp18
where gender = '남';

-- 사원 테이블에서 월급이 3000이 아닌 사원들의 이름과 월급과 직업을 
-- 출력하는데 입사일이 최근에 입사한 사원부터 출력하시오. 
select ename, sal, job
from emp
where sal <> 3000
order by hiredate desc;

-- 부서번호가 20번인 사원들의 이름과 직업과 월급을 출력하는데 직업은
-- ascending하게 출력한 것을 기준으로 월급을 descending 하게 출력하시오.
select ename, job, sal 
from emp 
where deptno = 20 
order by job asc, sal desc;

