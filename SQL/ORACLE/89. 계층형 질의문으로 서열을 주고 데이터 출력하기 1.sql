-- 사원 테이블의 서열을 계층형 질의문으로 출력하시오.
select level, empno, ename, mgr 
from emp 
start with mgr is null 
connect by prior empno = mgr;

-- 위의 SQL에 rpad를 이용해서 공백을 부여해서 서열이 눈에 띄게 하시오. 
select rpad('   ',level*3) || ename as employee, 
level, ename, sal, job
from emp 
start with ename ='KING'
connect by prior empno = mgr;

-- employees 테이블의 서열을 출력하시오. 
-- level, first_name, salary, job_id를 출력하는데 시작을 manager_id가 null 인
-- 사원을 시작으로 해서 출력하시오. 
select level, first_name, salary, job_id 
from employees 
start with manager_id is null
connect by prior job_id = manager_id;

-- 위의 SQL에 rpad를 이용해서 first_name 앞에 공백을 넣어서 서열이 눈에 띄게 하시오. 
select rpad(' ',level*3), first_name, salary, job_id 
from employees 
start with manager_id is null
connect by prior job_id = manager_id;

-- 아래의 계층형 질의문을 출력하는데 월급이 2400 이상인 사원들의 이름과 월급을 출력하시오. 
select level,empno, ename, mgr 
from emp 
start with ename = 'KING'
connect by prior empno = mgr;

select level,empno, ename, mgr 
from emp 
where sal >=2400
start with ename = 'KING'
connect by prior empno = mgr;


-- 부서번호가 10번, 20번인 사원들의 level, 이름, 월급, 부서번호를 출력하시오. 
select level, ename, sal, deptno 
from emp 
where deptno in (10,20) 
start with mgr is null 
connect by prior empno = mgr;