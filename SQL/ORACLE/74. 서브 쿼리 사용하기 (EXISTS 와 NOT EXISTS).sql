-- minus�� �̿��ؼ� �μ� ���̺��� �����ϴµ� ��� ���̺��� �������� �ʴ� �μ���ȣ�� ����Ͻÿ�. 
select deptno from dept 
minus
select deptno from emp;

-- exists���� �̿��ؼ� dept ���̺��� �μ���ȣ�� ����ϴµ� emp ���̺� �����ϴ� �μ���ȣ�鸸 ����Ͻÿ�.
select deptno 
from dept d
where exists( select 'X' from emp e 
            where e.deptno = d.deptno);
            
--departments ���̺��� �����ϴ� department_id�ε� employees ���̺��� �������� �ʴ� department_id�� ����Ͻÿ�. 
select department_id 
from departments d
where not exists(select 'X' from employees e where e.department_id = d.department_id);

-- telecom_table�� ������ ���� 
insert into telecom_table values('�˶�lg',15000,11);
insert into telecom_table values('�˶�sk',16000,9);

-- telecom_table���� ��Ż縦 ����ϴµ� �츮�� ���̺� �����ϴ� ��Ż縸 ����Ͻÿ�.
select telecom
from telecom_table t
where exists(select 'X' from emp18 e where e.telecom = t.telecom);

-- telecom_table���� �����ϴ� ��Ż��ε� emp18���� �������� �ʴ� ��Ż縦 ����Ͻÿ�. 
select telecom
from telecom_table t
where not exists(select 'X' from emp18 e where e.telecom = t.telecom);
