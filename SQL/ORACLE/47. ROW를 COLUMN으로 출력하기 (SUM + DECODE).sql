-- �μ���ȣ, �μ���ȣ �� �� ������ ����Ͻÿ�. 
select deptno, sum(sal) 
from emp 
group by deptno;

-- �μ���ȣ, �μ���ȣ�� 10���̸� ������ ���, �ƴϸ� 0�� ����Ͻÿ�. 
select deptno, decode(deptno, 10, sal,0) as "10"
from emp;

--���� sql�� �̾ �μ���ȣ�� 20 ���̸� ������ ���, �ƴϸ� 0�� ����ϰ� �� �μ���ȣ�� 
-- 30���̸� ������ ����ϰ� �ƴϸ� 0�� ����Ͻÿ�. 
select deptno,
decode(deptno, 10, sal,0) as "10",
decode(deptno, 20, sal,0) as "20", 
decode(deptno, 30, sal,0) as "30"
from emp;

-- (���� ���) 
-- ���� ����� �ٽ� ����ϴµ� �տ� �μ���ȣ�� ����� sum �� �Ἥ ������ �� ���ؼ�
-- ����Ͻÿ�.
select 
sum(decode(deptno, 10, sal,0)) as "10",
sum(decode(deptno, 20, sal,0)) as "20", 
sum(decode(deptno, 30, sal,0)) as "30"
from emp;

-- ����, ������ �� ������ ����Ͻÿ�. (���η� ���) 
select job, sum(sal) 
from emp 
group by job;

-- ����, ������ �� ������ ����Ͻÿ�. (���η� ���) 
select 
sum(decode(job,'PRESIDENT',sal))as PRESIDENT,
sum(decode(job,'MANAGER',sal))as MANAGER,
sum(decode(job,'SALESMAN',sal))as SALESMAN,
sum(decode(job,'CLERK',sal))as CLERK,
sum(decode(job,'ANALYST',sal))as ANALYST
from emp;

-- �츮 �� ���̺��� ��Ż縦 �̰� ��Ż纰 ��� ���̸� ����Ͻÿ�. (���η� ���) 
select 
round(avg(decode(telecom,'kt',age))) as kt, 
round(avg(decode(telecom,'sk',age))) as sk, 
round(avg(decode(telecom,'lg',age))) as lg, 
round(avg(decode(telecom,'�˶�KT',age))) as �˶�KT 
from emp18;

-- �Ի��� �⵵ (4�ڸ�), �Ի��� �⵵�� �� ������ ����Ͻÿ�. (���� ���) 
select to_char(hiredate,'rrrr') �Ի�⵵ , sum(sal) 
from emp 
group by to_char(hiredate,'rrrr');

-- ���� ����� ���η� ����Ͻÿ�. 
select 
sum(decode(to_char(hiredate,'rrrr'),'1980',sal)) as "1980",
sum(decode(to_char(hiredate,'rrrr'),'1981',sal)) as "1981",
sum(decode(to_char(hiredate,'rrrr'),'1982',sal)) as "1982",
sum(decode(to_char(hiredate,'rrrr'),'1983',sal)) as "1983"
from emp; 

-- ���� ����� �ٽ� ����ϴµ� �տ� job �� �ְ� group by job�� �Ἥ ��� ���
select job,
sum(decode(to_char(hiredate,'rrrr'),'1980',sal)) as "1980",
sum(decode(to_char(hiredate,'rrrr'),'1981',sal)) as "1981",
sum(decode(to_char(hiredate,'rrrr'),'1982',sal)) as "1982",
sum(decode(to_char(hiredate,'rrrr'),'1983',sal)) as "1983"
from emp
group by job; 

-- ������ �μ���ȣ�� �� ������ ����Ͻÿ�. (���� ���) 
select job, 
sum(decode(deptno,'10',sal)) as "10",
sum(decode(deptno,'20',sal)) as "20",
sum(decode(deptno,'30',sal)) as "30"
from emp 
group by job; 