-- �츮�� ���̺��� ������ ������ �л����� ��� �÷��� �����͸� ����Ͻÿ�. 
select * from emp18
where gender = '��';

-- ��� ���̺��� ������ 3000�� �ƴ� ������� �̸��� ���ް� ������ 
-- ����ϴµ� �Ի����� �ֱٿ� �Ի��� ������� ����Ͻÿ�. 
select ename, sal, job
from emp
where sal <> 3000
order by hiredate desc;

-- �μ���ȣ�� 20���� ������� �̸��� ������ ������ ����ϴµ� ������
-- ascending�ϰ� ����� ���� �������� ������ descending �ϰ� ����Ͻÿ�.
select ename, job, sal 
from emp 
where deptno = 20 
order by job asc, sal desc;

