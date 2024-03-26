-- 직업이 SALESMAN인 사원들과 월급이 같은 사원들의 이름과 월급을 출력하시오. 
select ename, sal
from emp 
where sal in (select sal from emp where job = 'SALESMAN');

-- 직업이 SALESMAN인 사원들과 월급이 같지 않은 사원들의 이름, 월급, 직업을 출력하시오. 
select ename, sal,job
from emp 
where sal not in (select sal from emp where job = 'SALESMAN');

-- 우리반 테이블에서 성씨가 김씨인 학생들과 나이가 같은 학생들의 이름과 나이를 출력하는데 
-- 성씨가 김씨인 학생들은 제외하고 출력하시오. 
select ename, age 
from emp18 
where age in (select age from emp18 where ename like '김%')
and substr(ename,1,1) <> '김';

-- 부서번호가 20번인 사원들과 같은 월급을 받는 사원들의 이름, 월급을 출력하시오. 
select ename, sal 
from emp 
where sal in (select sal from emp where deptno = 20);

-- 우리반 테이블에서 나이가 30대인 학생들의 통신사를 출력하는데 중복을 제거해서 출력하시오. 
select distinct(telecom)
from emp18 
where age in (select age from emp18 where age between 30 and 39);

-- 우리반 테이블에서 나이의 순위가 5등,9등,15등인 학생들의 이름, 나이를 출력하시오. 
select * 
from (select ename, age, dense_rank() over (order by age desc) as 순위
        from emp18 ) 
where 순위 in (5,9,15);