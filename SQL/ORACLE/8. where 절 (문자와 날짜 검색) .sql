-- 직업이 SALESMAN인 사원들의 이름과 직업을 출력하시오. 
select ename, job 
from emp
where job = 'SALESMAN';

-- 사원 이름이 SCOTT인 사원의 이름과 월급과 직업을 출력하시오. 
select ename, sal, job
from emp 
where ename = 'SCOTT';

-- 우리반 테이블에서 성별이 여자인 학생들의 이름과 성별과 주소를 출력하시오. 
select ename, gender, address 
from emp18
where gender = '여';

-- 입사일이 81년 11월 17일에 입사한 사원들의 이름과 입사일을 출력하시오. 
select ename, hiredate
from emp 
where hiredate = '81/11/17';

-- 통신사가 kt인 학생들의 이름과 통신사를 출력하시오. 
select ename, telecom
from emp18
where telecom = 'kt' or telecom = 'KT';

-- 직업이 SALESMAN이 아닌 사원들의 이름과 직업을 출력하시오. 
select ename, job 
from emp 
where job != 'SALESMAN';

-- 부서번호가 10번인 아닌 사원들의 이름과 월급과 부서번호를 출력하는데 월급이 높은 사원부터 
-- 출력하시오. 
select ename, sal, deptno
from emp 
where deptno <> 10
order by sal desc;