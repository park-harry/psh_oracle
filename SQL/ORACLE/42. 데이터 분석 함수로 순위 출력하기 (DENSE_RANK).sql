-- �̸�, ����, ������ ����ϴµ� rank�� dense_rank�� ������ 
select ename, sal, rank() over (order by sal desc) ���� 
from emp;

select ename, sal, dense_rank() over (order by sal desc) ���� 
from emp;

-- �μ���ȣ, �̸�, �Ի���, ������ ����ϴµ� ������ �μ� ��ȣ ���� ���� ���� �Ի��� 
-- ��������� ������ �ο��Ͻÿ�. 
select deptno, ename, hiredate, dense_rank() over (partition by deptno order by hiredate) ����
from emp; 

-- ���� 1250�� ��� ���̺��� ������ ������ ��� �Ǵ°�? 
select dense_rank(1250) within group (order by sal desc) ���� 
from emp;

-- 81/11/17�� �Ի��� ����� �� ��°�� �Ի��� ����ΰ�? 
select dense_rank('81/11/17') within group (order by hiredate) ���� 
from emp;

-- �츮�� ���̺��� ����, �̸�, ����, ������ ����ϴµ� ������ ���� ���� ���� ���̰� 
-- ���� ������� ������ �ο��Ͻÿ�. 
select gender, ename, age, dense_rank() over (partition by gender order by age desc)����
from emp18;