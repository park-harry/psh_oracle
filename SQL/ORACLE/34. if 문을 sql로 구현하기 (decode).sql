-- �̸�, �μ���ȣ, ���ʽ��� ����Ͻÿ�. ���ʽ��� �μ���ȣ�� 10���̸� 5000�� ����ϰ� 
-- �μ���ȣ�� 20���̸� 3000�� ����ϰ� ������ �μ���ȣ�� 0�� ����Ͻÿ�.
select ename, deptno, decode(deptno, 10, 5000, 20, 3000,0) as bonus 
from emp;

-- �̸�, ����, ���ʽ��� ����ϴµ� ���ʽ��� ������ SALESMAN �̸� 5600, �׷��� ������ 0�� ����Ͻÿ�. 
select ename, job, decode(job, 'SALESMAN', 5600,0) as bonus 
from emp;

-- �̸�, ����, ���ʽ��� ����ϴµ� ���ʽ��� ������ SALESMAN �̸� 5600, ������ analyst�� 
-- 4500, ������ clerk�̸� 2300, ������ ������ 100�� ����ϴµ� ���ʽ��� ���� ������ ����Ͻÿ�. 
select ename, decode(job,  'SALESMAN', 5600, 'ANALYST',4500,'CLERK',2300,100) as bonus 
from emp 
order by bonus desc;

-- �̸�, ����, �Ի���, �Ի��� �⵵�� 4�ڸ��� ����ϰ� ���ʽ��� ����ϴµ� ���ʽ��� 
-- �Ի��� �⵵�� 1980�̸� 9000, 1981�̸� 7000, ������ �⵵�� 500�� ����Ͻÿ�. 
select ename, sal, to_char(hiredate,'RRRR') as hireyear, 
    decode(to_char(hiredate,'RRRR'),'1980',9000,'1981',7000,500) as bonus
from emp;

-- �̸�, ����, ������ ����ϴµ� ������ ���� ������� ����Ͻÿ�. 
select ename, job, sal 
from emp 
order by sal desc; 

-- �̸��� ���ް� ���ʽ��� ����ϴµ� ���ʽ��� ������ president�� null, ������ ������� �ڱ� ������ 
-- ���ʽ��� ��µǰ� �Ͻÿ�. 
select ename, sal, decode(job, 'PRESIDENT', NULL,sal) as bonus 
from emp;

-- ���� ����� �ٽ� ����ϴµ� ���ʽ��� ���� ������� ����Ͻÿ�. 
select ename, sal, decode(job, 'PRESIDENT', NULL,sal) as bonus 
from emp
order by bonus desc; --> desc�� ����ϸ� null ���� �� ���� �ö󰣴�. 

-- ���� ����� �ٽ� ����ϴµ�  null ���� ������ ���ÿ�. 
select ename, sal, decode(job, 'PRESIDENT', NULL,sal) as bonus 
from emp
order by bonus desc nulls last; 
/* nulls last�� �ᵵ 950�� 800�� �����ǿ� ��ġ�� �ִ�. �̴� decode�� ���״�. 
decode(job, 'PRESIDENT', NULL,sal) -> decode�� �� ��° ���� ���� ������ ������ ���ؼ� �� ���� ���� ���� ������ ������ �����ȴ�. 
null �� �������̹Ƿ� sal�� ���������� ��� �Ǿ���. ���������� ��µ� ���, ���� 9�� ASCII code�� ���� ���� ������ 950�� 800�� �����ǿ� ��ġ�ϰ� �ȴ�. */

-- ���� ����� �ٽ� ����ϴµ� 950�� 800�� ���� ��ġ�� �����ÿ�. 
-- ��� 1. null ��� ���� 0�� ���� (nulls last�� �ʿ� ����.) 
select ename, sal, decode(job, 'PRESIDENT',0,sal) as bonus 
from emp
order by bonus desc; 

-- ��� 2. null ���� ���� bonus�� ���������� ��ȯ 
select ename, sal, decode(job, 'PRESIDENT',null,sal) as bonus 
from emp
order by to_number(bonus) desc nulls last; 

