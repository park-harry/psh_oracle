-- ������ 1000���� 3000 ������ ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where sal between 1000 and 3000;
-- 1000 �� 3000�� ���Ե� ����, �Ʒ��� ���İ� �����ϴ�. 
select ename, sal 
from emp 
where sal >= 1000 and sal <= 3000;

-- �Ի����� 81/1/1 ���� 81/12/31 ���̿� �Ի��� ������� �̸��� 
-- �Ի����� ����Ͻÿ�. 
select ename, hiredate 
  from emp 
  where hiredate between '81/1/1' and '81/12/31';

-- �츮�� ���̺��� 1990��뿡 �¾ �л����� �̸��� ������ ����Ͻÿ�.
select ename, birth 
from emp18 
where birth between '1990/1/1' and '1999/12/31';

-- ������ 1000���� 3000 ���̰� �ƴ� ������� �̸��� ������ ����Ͻÿ�.
select ename, sal 
from emp 
where sal not between 1000 and 3000;  
 
explain plan for 
select ename, sal 
from emp 
where sal not between 1000 and 3000;

select * from table(dbms_xplan.display);

select ename, hiredate 
from emp 
where hiredate not between '1981/1/1'and '1981/12/31'; 

-- 1981�⵵�� �Ի��� ������� �̸��� ���ް� �Ի����� ����ϴµ� �Ի����� 
-- �ֱٿ� �Ի��� ������� ����Ͻÿ�.
select ename, sal, hiredate 
from emp 
where hiredate between '1981/1/1'and '1981/12/31'
order by hiredate desc;