-- ��� ���̺��� ������ 3000 �̻��� ����� ���
select ename, sal 
from emp 
where sal = 3000;

-- �����ȣ�� 7788���� ����� �����ȣ�� �̸��� ������ ��ȸ�Ͻÿ�.
select empno, ename, sal
from emp 
where empno = 7788;

-- ������ 2000 �̻��� ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where sal >= 2000;

-- ���� 2500 ������ ������� �̸��� ������ ����ϴµ� ������ 
-- ���� ������� ����Ͻÿ�. 
select ename, sal 
from emp 
where sal <= 2500
order by sal desc;