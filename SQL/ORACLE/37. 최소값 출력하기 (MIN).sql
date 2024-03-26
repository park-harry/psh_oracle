-- ��� ���̺��� �ּ� ������ ����Ͻÿ�. 
select min(sal) 
from emp;

-- ����, ������ �ּҿ����� ����ϴµ� ������ �ּ� ������ ���� �ͺ��� ����Ͻÿ�.
select job, min(sal) 
from emp 
group by job 
order by min(sal) desc;

-- ����, ���� �� �ּ� ���̸� ����Ͻÿ�. 
select gender, min(age) 
from emp18 
group by gender;

-- �μ���ȣ, �μ���ȣ �� �ּ� ������ ����ϴµ� �μ� ��ȣ�� 10��, 20���� ��µǰ� �Ͻÿ�. 
select deptno, min(sal) 
from emp 
where deptno in (10,20)
group by deptno;

-- �츮�� ���̺��� �� �� ����ϰ� ���� �� �ּ� ���̸� ����Ͻÿ�. 
select substr(ename,1,1) as ����, min(age) 
from emp18 
group by substr(ename,1,1);