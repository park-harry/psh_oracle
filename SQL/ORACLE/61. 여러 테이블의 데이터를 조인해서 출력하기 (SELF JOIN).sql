-- ����̸�, �������� �̸��� ����Ͻÿ�. 
select ���.ename ����̸�, ������.ename �������̸�
from emp ���, emp ������ 
where ���.mgr = ������.empno;

-- ����̸�, ��� ����, ������ �̸�, �������� ������ ����ϴµ� �����ں��� �� ���� ������ �޴� ����鸸 ����Ͻÿ�. 
select ���.ename ����̸�, ���.sal �������, ������.ename �������̸�, ������.sal �����ڿ���
from emp ���, emp ������ 
where ���.mgr = ������.empno 
and ������.sal < ���.sal;

-- ����̸�, ��� �Ի���, ������ �̸�, �������� �Ի����� ����ϴµ� �����ں��� ���� ����鸸 ����Ͻÿ�. 
select ���.ename ����̸�, ���.hiredate ����Ի���, ������.ename �������̸�, ������.hiredate �������Ի���
from emp ���, emp ������ 
where ���.mgr = ������.empno
and ���.hiredate < ������.hiredate; 

-- employees ���̺��� ��ȸ 
select * from hr.employees;

-- department ���̺��� ��ȸ
select * from hr.departments;

-- SQL�� �ۼ��� �� hr.�� ������ �ʵ��� synonym�� �����Ͻÿ�. 
create public synonym employees for hr.employees;
create public synonym departments for hr.departments;

-- ����: employees ���̺�� department ���̺��� �����ؼ� last_name �� email, depatment_name�� ����Ͻÿ�. 
desc employees;
desc departments;

select e.last_name, e.email, d.department_name 
from employees e, departments d 
where e.department_id = d.department_id;

-- employees ���̺��� self join �ؼ� ����̸� (last_name)�� ������ �̸�(last_name)�� ������ ��ȣ�� 100���� 
--����� ����Ͻÿ�. 
select e.last_name as ����̸�, m.last_name as �������̸� 
from employees e, employees m 
where e.last_name = m.last_name and m.employee_id = 100;
