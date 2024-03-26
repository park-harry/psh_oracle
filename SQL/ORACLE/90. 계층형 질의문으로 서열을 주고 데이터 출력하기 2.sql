-- 사원 테이블에서 level을 공백으로 변경한 계층형 질의문을 출력하시오.
select rpad(' ',level*3) || ename as employee, level, ename, sal, job 
from emp 
start with mgr is null 
connect by prior empno = mgr;

-- 위의 결과에서 BLAKE만 제외하고 출력하시오. 
select rpad(' ',level*3) || ename as employee, level, ename, sal, job 
from emp 
where ename <> 'BLAKE'
start with mgr is null 
connect by prior empno = mgr;

-- BLAKE 뿐만 아니라 BLAKE의 팀원들도 전부 안 나오게 하시오. 
select rpad(' ',level*3) || ename as employee, level, ename, sal, job 
from emp 
start with mgr is null 
connect by prior empno = mgr and ename <> 'BLAKE';

-- employees 테이블에서 아래의 결과를 다시 출력하는데 first_name이 Adam과 Adam의 팀원들을 전부 출력 안되게 하시오. 
select rpad('      ', level*3) ||first_name as name, salary, job_id 
from employees 
start with manager_id is null 
connect by prior employee_id = manager_id;

-- 답: 
select rpad('      ', level*3) ||first_name as name, salary, job_id 
from employees 
start with manager_id is null 
connect by prior employee_id = manager_id and first_name <> 'Adam';

-- 위의 결과를 다시 출력하는데 Adam과 Adam 팀원들 뿐만 아니라 Den과 Den의 팀원들도 안 나오게 하시오. 
select rpad('      ', level*3) ||first_name as name, salary, job_id 
from employees 
start with manager_id is null 
connect by prior employee_id = manager_id and first_name not in('Adam','Den');