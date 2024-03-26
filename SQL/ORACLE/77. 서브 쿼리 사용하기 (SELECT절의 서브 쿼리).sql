-- (��������) �̸�, ����, ��� ���̺��� �� ������ ����Ͻÿ�. 
select ename, sal, sum(sal) over() as ��Ż
from emp; 

-- ���� ����� select ���� ���������� ��Į�� ���������� �����Ͻÿ�. 
select ename, sal, 
(select sum(sal) from emp) as ��Ż
from emp; 

-- �̸�, ����, ������ salesman�� ������� �� ������ ����Ͻÿ�. 
select ename, sal, 
(select sum(sal) from emp where job = 'SALESMAN') as ��Ż
from emp; 

-- �̸�, ����, ����, �츮�� ���̺��� ��� ���̸� ����Ͻÿ�. 
select ename, gender, age, (select round(avg(age)) from emp18) as ��ճ��� 
from emp18;

-- �̸�, ����, ������ salesman�� ��Ż����, ������ salesman�� ������� �ִ����, 
-- ������ salesman�� �ּ� ������ ����Ͻÿ�. 
select ename, sal, 
(select sum(sal) from emp where job = 'SALESMAN') AS ��Ż����, 
(select max(sal) from emp where job = 'SALESMAN') AS �ִ����, 
(select min(sal) from emp where job = 'SALESMAN') AS �ּҿ���
from emp;

-- (��Ʈ ����) ������ salesman�� ��Ż����, �ִ����, �ּҿ����� ����Ͻÿ�. 
select sum(sal), max(sal), min(sal)
from emp where job = 'SALESMAN';

-- �Ʒ��� ���� SQLP �ְ��� ������ �����ؼ� �ۼ��Ͻÿ�. 
select ename, sal, 
(select sum(sal) ||',' || max(sal) ||',' ||min(sal) 
from emp where job = 'SALESMAN') 
from emp;

select ename,sal, 
    substr(total,1,4) as sumsal,
    substr(total,6,4) as maxsal,
    substr(total,11,4)as minsal
from 
    (select ename, sal, 
    (select sum(sal) ||',' || max(sal) ||',' ||min(sal) 
    from emp where job = 'SALESMAN') as total
    from emp);