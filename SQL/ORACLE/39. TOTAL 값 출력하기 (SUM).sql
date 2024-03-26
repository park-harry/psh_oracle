-- ��� ���̺��� ������ �� ���� ���Ͻÿ�. 
select sum(sal) 
from emp;

-- ������ ������ �� ������ ����Ͻÿ�. 
select job, sum(sal) 
from emp 
group by job;

-- ���� ����� �ٽ� ����ϴµ� ������ abcd ������� �����ؼ� ����Ͻÿ�. 
select job, sum(sal) 
from emp 
group by job
order by job;

--���� ����� �ٽ� ����ϴµ� ������ salesman �����ϰ� ����Ͻÿ�. 
select job, sum(sal) 
from emp 
where job <> 'SALESMAN'
group by job
order by job;

--���� ����� �ٽ� ����ϴµ� ������ �� ������ 5000 �̻��� �͸� ����Ͻÿ�. 
select job, sum(sal) 
from emp 
where job <> 'SALESMAN'
group by job
having sum(sal) >= 5000
order by job;
--> �׷� �Լ��� ������ �� ���� having ���� ����ؾ� �Ѵ�. 

-- �Ի��� �⵵ ��� (4�ڸ���), �׸��� �⵵�� �� ������ ����Ͻÿ�. 
select to_char(hiredate,'rrrr'), sum(sal)
from emp
group by to_char(hiredate,'rrrr');

-- ���� ����� �ٽ� ����ϴµ� �Ի��� �⵵�� 1980���� �����ϰ� ����Ͻÿ�. 
select to_char(hiredate,'rrrr'), sum(sal)
from emp
where to_char(hiredate,'rrrr') <>'1980'
group by to_char(hiredate,'rrrr');

-- ���� ����� �ٽ� ����ϴµ� �Ի��� �⵵�� �� ������ 4000 �̻��� �͸� ����Ͻÿ�. 
select to_char(hiredate,'rrrr'), sum(sal)
from emp
where to_char(hiredate,'rrrr') <>'1980'
group by to_char(hiredate,'rrrr')
having sum(sal) >=4000;

-- ���� ����� �ٽ� ����ϴµ� �Ի��� �⵵�� �� ������ ���� �ͺ��� ����Ͻÿ�. 
select to_char(hiredate,'rrrr') as �Ի�⵵, sum(sal) as �ѿ���
from emp
where to_char(hiredate,'rrrr') <>'1980'
group by to_char(hiredate,'rrrr')
having sum(sal) >=4000
order by �ѿ��� desc;