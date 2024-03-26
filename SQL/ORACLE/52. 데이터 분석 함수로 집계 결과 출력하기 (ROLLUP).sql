-- �μ���ȣ, �μ���ȣ �� �� ������ ����Ͻÿ�. 
select deptno, sum(sal) 
from emp 
group by deptno;

--  �μ���ȣ, �μ���ȣ �� �� ������ ����ϴµ�, �μ���ȣ�� �� ���޿� ���� ��ü �հ谡
-- �� �Ʒ��� ��µǰ� �Ͻÿ�. 
select deptno, sum(sal) 
from emp 
group by rollup(deptno);

-- ��Ż� �̰�, ��Ż� �� �ο����� ����ϴµ� �� �Ʒ��� ��ü �ο����� ��µǰ� �Ͻÿ�.
select telecom, count(*)  
from emp18
group by rollup(telecom); 

-- ���� ����� rollup ���� total �̶�� ���ÿ�. 
select nvl(telecom,'total') as telecom, count(*)  
from emp18
group by rollup(telecom); 

-- ����, ������ �� ������ ����ϴµ� �� �Ʒ��� ��ü �� ������ ������ ���� '��ü ����'��� ������ �Ͻÿ�. 
select nvl(job,'��ü ����'), sum(sal) 
from emp 
group by rollup(job); 

-- �Ի��� �⵵(4�ڸ�), �Ի��� �⵵�� �� ������ ����ϴµ� �� �Ʒ��� ��ü �� ���޵� ����Ͻÿ�. 
select nvl(to_char(hiredate, 'rrrr'),'total') as �Ի�⵵, sum(sal) 
from emp 
group by rollup(to_char(hiredate, 'rrrr'));

-- �μ���ȣ, ����, �μ���ȣ�� ������ �� ������ ����Ͻÿ�. 
select deptno, job, sum(sal) 
from emp 
group by deptno, job
order by deptno, job;

-- ���� ����� �ٽ� ����ϴµ� ROLLUP�� �Ἥ ����Ͻÿ�. 
select deptno, job, sum(sal) 
from emp 
group by rollup(deptno, job)
order by deptno;

-- �츮 �� ���̺��� ����, ��Ż�, ��� ���̸� ����ϴµ� rollup�� �̿��Ͽ� �Ʒ��� 
-- 3���� �׷��ε� ��� ������ ��µǰ� �Ͻÿ�. 
-- ��µǴ� ���: 
-- 1. gender, telecom 
-- 2. gender 
-- 3. ��ü  
select gender, telecom, round(avg(age),2) 
from emp18
group by rollup(gender,telecom)
order by gender, telecom;

--���� ����� �ٽ� ����ϴµ� null �ڸ��� ��� ä��ÿ�. 
select gender, 
case when gender is null then '��ü��Ż' 
else nvl(telecom,'��Ż') end as ��Ż�, 
round(avg(age),2) as ��ճ���
from emp18
group by rollup(gender,telecom)
order by gender, telecom;

-- �⵵�� ���η� ���, ������ ���η� ����ϰ� ������ �հ�, �⵵�� �հ�, �׸��� �� �հ踦 �����Ͻÿ�. (rollup ���) 
select nvl(job,'�հ�') as job, 
nvl(sum(decode(to_char(hiredate,'rrrr'),'1980',sal)),0) as "1980",
nvl(sum(decode(to_char(hiredate,'rrrr'),'1981',sal)),0) as "1981",
nvl(sum(decode(to_char(hiredate,'rrrr'),'1982',sal)),0) as "1982",
nvl(sum(decode(to_char(hiredate,'rrrr'),'1983',sal)),0) as "1983",
sum(sal)
from emp 
group by rollup(job)
order by job;