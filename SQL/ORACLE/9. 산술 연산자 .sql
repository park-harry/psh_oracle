-- �̸�, ���� (sal *12) �� ����Ͻÿ�. 
select ename, sal*12 as ���� 
from emp;

-- ������ 36000 �̻��� ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal*12 as ���� 
from emp
where sal *12 >= 36000;
-- ���� ������ from -> where -> select �̹Ƿ�, where ���� �����̶�� �Է½�, ������ ���.
-- emp ���̺��� �����̶�� column�� ���� �����̴�. 

-- ������ 10000 �̻��� ������� �̸��� ������ ����ϴµ� ������ ���� ������� ����Ͻÿ�. 
select ename, sal*12 as ���� 
from emp
where sal *12 >= 10000
order by ���� desc;

-- �μ���ȣ�� 20���� ������� ������ ����ϴµ� �ߺ��� �����ؼ� ����ϰ� 
-- �÷����� �ѱ۷� ������ ������� ����Ͻÿ�. 
select distinct job, deptno as "������ ����"
from emp
where deptno = 20;