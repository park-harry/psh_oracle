-- �����ȣ�� 7788, 7902, 7369 ���� ������� �����ȣ�� �̸��� ��ȸ�Ͻÿ�. 
select empno, ename
from emp 
where empno in (7788,7902,7369);

-- ������ SALESMAN, ANALYST �� ������� �̸��� ������ ����Ͻÿ�. 
select ename, job 
from emp
where job in ('SALESMAN', 'ANALYST');

-- �츮�� ���̺��� �� �� �达, �̾�, �ھ� �� �л����� �̸��� �ּҸ� ����Ͻÿ�.
select ename, address
from emp18 
where ename like '��%' 
or ename like '��%' 
or ename like'��%';

-- �μ���ȣ�� 10��, 20���� �ƴ� ������� �̸��� �μ���ȣ�� ����Ͻÿ�. 
select ename, deptno
from emp 
where deptno not in (10,20);

-- �μ���ȣ�� 10��, 20���� ������� �̸��� ���ް� �μ���ȣ�� ����ϴµ� 
-- ������ ���� ������� ����Ͻÿ�. 
select ename, sal, deptno
from emp 
where deptno in (10,20) 
order by sal desc;

-- �츮�� ���̺��� ��Ż簡 kt �� �л����� �̸��� ��Ż縦 ����ϴµ� �˶� kt�� 
-- ��µǾ�� �Ѵ�. (or ��� ����!) 
select ename, telecom 
from emp18
where lower(telecom) in ('kt','�˶� kt');

-- ������ SALESMAN, ANALYST �� �ƴ� ������� �̸��� ������ ����ϴµ� 
-- ������ ���� ������� ����Ͻÿ�.
select ename, sal 
from emp 
where job not in ('SALESMAN','ANALYST')
order by sal desc;

-- �̸��� ����ϴµ� �̸��� A%%B�� A%B�� �����ϰ� ����Ͻÿ�. 
select ename 
from emp 
where ename not in ('A%%B','A%B');

-- ���� ����� �ٽ� ����ϴµ� ù ��° ö�ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ����Ͻÿ�.
select INITCAP(ename) 
from emp 
where ename not in ('A%%B','A%B');