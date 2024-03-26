-- �̸�, ����, ���޿� ���� ������ ����Ͻÿ�. (��������) 
select ename, sal, dense_rank() over (order by sal desc) ����
from emp;

-- ���� ������� ������ 3��� 5� ����Ͻÿ�. 
select * 
from (select ename, sal, dense_rank() over (order by sal desc) ����
      from emp) 
where ���� in (3,5);

-- ����, �̸�, ����, ������ ����ϴµ� ������ �������� ���� ������ ���� ������� ������ �ο��Ͻÿ�. (��������)  
select job, ename, sal, dense_rank() over (partition by job order by sal desc) ����
from emp;

-- ���� ����� �ٽ� ����Ѵ��� �� �������� ������ 1���� ����鸸 ����Ͻÿ�. 
select * 
from (select job, ename, sal, dense_rank() over (partition by job order by sal desc) ����
from emp)
where ���� = 1;

-- �μ� ��ȣ, �μ� ��ȣ�� ��� ������ ����Ͻÿ�. (��������) 
select deptno  , round(avg(sal)) 
from emp 
group by deptno;

-- �μ� ��ȣ, �̸�, ����, �ڱⰡ ���� �μ���ȣ�� ��� ������ ����Ͻÿ�. (��������) 
select deptno, ename, sal, round(avg(sal) over(partition by deptno)) as "�μ��� ��� ����"
from emp;

-- ���� ����� �ٽ� ����ϴµ� �ڱ��� ������ �ڱⰡ ���� �μ���ȣ�� ��� ���޺��� �� ū ����鸸 ����Ͻÿ�. 
select * 
from (select deptno, ename, sal, round(avg(sal) over(partition by deptno)) as "�μ��� ��� ����"
    from emp)
where sal > "�μ��� ��� ����";

select * 
from (select ename, sal, hiredate, 
			dense_rank() over (order by sal desc) as ����
      from emp) 
where ���� =2;