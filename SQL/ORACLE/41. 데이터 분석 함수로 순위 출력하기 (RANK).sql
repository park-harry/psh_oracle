-- �̸�, ����, ���޿� ���� ������ ����Ͻÿ�. 
select ename, sal, rank() over (order by sal desc) ���� 
from emp;

-- �μ� ��ȣ, �̸�, ����, ���޿� ���� ������ ����ϴµ� �μ���ȣ ���� ���� ������ ���� 
-- ������� ������ �ο��Ͻÿ�. 
select deptno, ename, sal, rank() over (partition by deptno order by sal desc) ����
from emp;

-- ����, �̸�, ����, ������ ����ϴµ� ������ ���� ���� ���� ������ ���� ��� ������ 
-- ������ �ο��Ͻÿ�. 
select job, ename, sal, rank() over (partition by job order by sal desc) ����
from emp; 

-- ������ 1000���� 3000 ������ ������� �̸�, ����, ���޿� ���� ������ ����Ͻÿ�. 
select ename, sal, rank() over (order by sal desc) ����
from emp 
where sal between 1000 and 3000;