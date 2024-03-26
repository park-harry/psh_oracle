-- ������ SALESMAN�� ������ ������ ���� ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal
from emp 
where sal in (select sal from emp where job = 'SALESMAN');

-- ������ SALESMAN�� ������ ������ ���� ���� ������� �̸�, ����, ������ ����Ͻÿ�. 
select ename, sal,job
from emp 
where sal not in (select sal from emp where job = 'SALESMAN');

-- �츮�� ���̺��� ������ �达�� �л���� ���̰� ���� �л����� �̸��� ���̸� ����ϴµ� 
-- ������ �达�� �л����� �����ϰ� ����Ͻÿ�. 
select ename, age 
from emp18 
where age in (select age from emp18 where ename like '��%')
and substr(ename,1,1) <> '��';

-- �μ���ȣ�� 20���� ������ ���� ������ �޴� ������� �̸�, ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where sal in (select sal from emp where deptno = 20);

-- �츮�� ���̺��� ���̰� 30���� �л����� ��Ż縦 ����ϴµ� �ߺ��� �����ؼ� ����Ͻÿ�. 
select distinct(telecom)
from emp18 
where age in (select age from emp18 where age between 30 and 39);

-- �츮�� ���̺��� ������ ������ 5��,9��,15���� �л����� �̸�, ���̸� ����Ͻÿ�. 
select * 
from (select ename, age, dense_rank() over (order by age desc) as ����
        from emp18 ) 
where ���� in (5,9,15);