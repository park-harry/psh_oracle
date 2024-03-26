-- ��� ���̺��� level�� �������� ������ ������ ���ǹ��� ����Ͻÿ�.
select rpad(' ',level*3) || ename as employee, level, ename, sal, job 
from emp 
start with mgr is null 
connect by prior empno = mgr;

-- ���� ������� BLAKE�� �����ϰ� ����Ͻÿ�. 
select rpad(' ',level*3) || ename as employee, level, ename, sal, job 
from emp 
where ename <> 'BLAKE'
start with mgr is null 
connect by prior empno = mgr;

-- BLAKE �Ӹ� �ƴ϶� BLAKE�� �����鵵 ���� �� ������ �Ͻÿ�. 
select rpad(' ',level*3) || ename as employee, level, ename, sal, job 
from emp 
start with mgr is null 
connect by prior empno = mgr and ename <> 'BLAKE';

-- employees ���̺��� �Ʒ��� ����� �ٽ� ����ϴµ� first_name�� Adam�� Adam�� �������� ���� ��� �ȵǰ� �Ͻÿ�. 
select rpad('      ', level*3) ||first_name as name, salary, job_id 
from employees 
start with manager_id is null 
connect by prior employee_id = manager_id;

-- ��: 
select rpad('      ', level*3) ||first_name as name, salary, job_id 
from employees 
start with manager_id is null 
connect by prior employee_id = manager_id and first_name <> 'Adam';

-- ���� ����� �ٽ� ����ϴµ� Adam�� Adam ������ �Ӹ� �ƴ϶� Den�� Den�� �����鵵 �� ������ �Ͻÿ�. 
select rpad('      ', level*3) ||first_name as name, salary, job_id 
from employees 
start with manager_id is null 
connect by prior employee_id = manager_id and first_name not in('Adam','Den');