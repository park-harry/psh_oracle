-- 이름, 연봉 (sal *12) 을 출력하시오. 
select ename, sal*12 as 연봉 
from emp;

-- 연봉이 36000 이상인 사원들의 이름과 연봉을 출력하시오. 
select ename, sal*12 as 연봉 
from emp
where sal *12 >= 36000;
-- 실행 순서가 from -> where -> select 이므로, where 절에 연봉이라고 입력시, 오류가 뜬다.
-- emp 테이블에는 연봉이라는 column이 없기 때문이다. 

-- 연봉이 10000 이상인 사원들의 이름과 연봉을 출력하는데 연봉이 높은 사원부터 출력하시오. 
select ename, sal*12 as 연봉 
from emp
where sal *12 >= 10000
order by 연봉 desc;

-- 부서번호가 20번인 사원들의 직업을 출력하는데 중복을 제거해서 출력하고 
-- 컬럼명을 한글로 직업의 종류라고 출력하시오. 
select distinct job, deptno as "직업의 종류"
from emp
where deptno = 20;