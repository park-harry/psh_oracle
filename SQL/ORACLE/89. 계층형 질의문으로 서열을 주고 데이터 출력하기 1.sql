-- ��� ���̺��� ������ ������ ���ǹ����� ����Ͻÿ�.
select level, empno, ename, mgr 
from emp 
start with mgr is null 
connect by prior empno = mgr;

-- ���� SQL�� rpad�� �̿��ؼ� ������ �ο��ؼ� ������ ���� ��� �Ͻÿ�. 
select rpad('   ',level*3) || ename as employee, 
level, ename, sal, job
from emp 
start with ename ='KING'
connect by prior empno = mgr;

-- employees ���̺��� ������ ����Ͻÿ�. 
-- level, first_name, salary, job_id�� ����ϴµ� ������ manager_id�� null ��
-- ����� �������� �ؼ� ����Ͻÿ�. 
select level, first_name, salary, job_id 
from employees 
start with manager_id is null
connect by prior job_id = manager_id;

-- ���� SQL�� rpad�� �̿��ؼ� first_name �տ� ������ �־ ������ ���� ��� �Ͻÿ�. 
select rpad(' ',level*3), first_name, salary, job_id 
from employees 
start with manager_id is null
connect by prior job_id = manager_id;

-- �Ʒ��� ������ ���ǹ��� ����ϴµ� ������ 2400 �̻��� ������� �̸��� ������ ����Ͻÿ�. 
select level,empno, ename, mgr 
from emp 
start with ename = 'KING'
connect by prior empno = mgr;

select level,empno, ename, mgr 
from emp 
where sal >=2400
start with ename = 'KING'
connect by prior empno = mgr;


-- �μ���ȣ�� 10��, 20���� ������� level, �̸�, ����, �μ���ȣ�� ����Ͻÿ�. 
select level, ename, sal, deptno 
from emp 
where deptno in (10,20) 
start with mgr is null 
connect by prior empno = mgr;