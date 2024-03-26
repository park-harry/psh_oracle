-- ������ view�� �����Ͻÿ�. 
create or replace view emp_view 
as 
select empno, ename, job, mgr, hiredate, deptno 
from emp;

select * from emp_view;

-- emp_view �� �����Ϳ��� KING�� ������ salesman���� �����Ͻÿ�. 
update emp_view 
set job = 'SALESMAN' where ename ='KING';

-- emp ���̺��� ������ analyst, salesman, clerk�� ������� ��� �÷��� ���̰� �ϴ� view�� emp_view2�� �����Ͻÿ�. 
create or replace view emp_view2 
as 
select * from emp where job in ('ANALYST','SALESMAN','CLERK');

-- emp_view2�� �����͸� �����ϴµ� ford�� ������ 0���� �����Ͻÿ�. 
update emp_view2
set sal = 0 where ename = 'FORD';

-- ����̸�, �μ���ġ, ����, �μ���ȣ�� ����ϴ� view �� �����Ͻÿ� (emp_dept_view) 
create or replace view emp_dept_view 
as 
select e.ename, d.loc, e.sal, e.deptno
from emp e, dept d where e.deptno = d.deptno;
