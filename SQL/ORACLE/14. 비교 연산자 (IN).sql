-- 사원번호가 7788, 7902, 7369 번인 사원들의 사원번호와 이름을 조회하시오. 
select empno, ename
from emp 
where empno in (7788,7902,7369);

-- 직업이 SALESMAN, ANALYST 인 사원들의 이름과 직업을 출력하시오. 
select ename, job 
from emp
where job in ('SALESMAN', 'ANALYST');

-- 우리반 테이블에서 성 이 김씨, 이씨, 박씨 인 학생들의 이름과 주소를 출력하시오.
select ename, address
from emp18 
where ename like '김%' 
or ename like '이%' 
or ename like'박%';

-- 부서번호가 10번, 20번이 아닌 사원들의 이름과 부서번호를 출력하시오. 
select ename, deptno
from emp 
where deptno not in (10,20);

-- 부서번호가 10번, 20번인 사원들의 이름과 월급과 부서번호를 출력하는데 
-- 월급이 높은 사원부터 출력하시오. 
select ename, sal, deptno
from emp 
where deptno in (10,20) 
order by sal desc;

-- 우리반 테이블에서 통신사가 kt 인 학생들의 이름과 통신사를 출력하는데 알뜰 kt도 
-- 출력되어야 한다. (or 사용 금지!) 
select ename, telecom 
from emp18
where lower(telecom) in ('kt','알뜰 kt');

-- 직업이 SALESMAN, ANALYST 가 아닌 사원들의 이름과 월급을 출력하는데 
-- 월급이 높은 사원부터 출력하시오.
select ename, sal 
from emp 
where job not in ('SALESMAN','ANALYST')
order by sal desc;

-- 이름을 출력하는데 이름이 A%%B와 A%B는 제외하고 출력하시오. 
select ename 
from emp 
where ename not in ('A%%B','A%B');

-- 위의 결과를 다시 출력하는데 첫 번째 철자는 대문자로, 나머지는 소문자로 출력하시오.
select INITCAP(ename) 
from emp 
where ename not in ('A%%B','A%B');