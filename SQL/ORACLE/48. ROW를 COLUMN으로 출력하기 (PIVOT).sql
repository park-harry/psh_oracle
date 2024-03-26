-- �μ���ȣ, �μ���ȣ �� �� ������ ���η� ����ϴµ� pivot �� ����ϱ� 
select * 
from (select deptno, sal from emp)
pivot(sum(sal) for deptno in (10,20,30));

-- pivot ���� ����ؼ� ������ �ѿ����� ���η� ����Ͻÿ�. 
select * 
from (select job, sal from emp) 
pivot(sum(sal) for job in ('SALESMAN', 'ANALYST', 'CLERK', 'MANAGER', 'PRESIDENT'));

-- �Ի��� �⵵�� �� ������ pivot ������ ����ϱ� 
select *
from (select to_char(hiredate,'rrrr')as hireyear, sal from emp) 
pivot(sum(sal) for hireyear in ('1980','1981','1982','1983'));

-- �츮 �� ���̺��� ����, ���� �� ��� ���̸� ����Ͻÿ�. (���η�) 
// 1. sum + decode ��� 
select 
round(avg(decode(gender,'��',age))) as "���� ��� ����",
round(avg(decode(gender,'��',age))) as "���� ��� ����"
from emp18;
// 2. pivot�� ��� 
select round("���� ��� ����"),round("���� ��� ����")
from (select gender, age from emp18) 
pivot(avg(age) for gender in ('��' as "���� ��� ����",'��' as "���� ��� ����"));

select * 
from (select to_char(hiredate,'RRRR') as hireyear, job, sal from emp) 
pivot(sum(sal) for job in ('ANALYST','CLERK','MANAGER','SALESMAN','PRESIDENT'));
