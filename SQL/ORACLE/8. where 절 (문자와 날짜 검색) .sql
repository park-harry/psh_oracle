-- ������ SALESMAN�� ������� �̸��� ������ ����Ͻÿ�. 
select ename, job 
from emp
where job = 'SALESMAN';

-- ��� �̸��� SCOTT�� ����� �̸��� ���ް� ������ ����Ͻÿ�. 
select ename, sal, job
from emp 
where ename = 'SCOTT';

-- �츮�� ���̺��� ������ ������ �л����� �̸��� ������ �ּҸ� ����Ͻÿ�. 
select ename, gender, address 
from emp18
where gender = '��';

-- �Ի����� 81�� 11�� 17�Ͽ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�. 
select ename, hiredate
from emp 
where hiredate = '81/11/17';

-- ��Ż簡 kt�� �л����� �̸��� ��Ż縦 ����Ͻÿ�. 
select ename, telecom
from emp18
where telecom = 'kt' or telecom = 'KT';

-- ������ SALESMAN�� �ƴ� ������� �̸��� ������ ����Ͻÿ�. 
select ename, job 
from emp 
where job != 'SALESMAN';

-- �μ���ȣ�� 10���� �ƴ� ������� �̸��� ���ް� �μ���ȣ�� ����ϴµ� ������ ���� ������� 
-- ����Ͻÿ�. 
select ename, sal, deptno
from emp 
where deptno <> 10
order by sal desc;