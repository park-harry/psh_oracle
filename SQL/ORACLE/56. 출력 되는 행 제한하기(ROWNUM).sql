select row_number() over (order by sal desc) as ��ȣ, 
ename, sal, job 
from emp 
where job = 'SALESMAN';

select rownum as ��ȣ, ename, sal, job
from emp 
where job = 'SALESMAN';

-- �� ���� 3�ٸ� ���ڴ�.
select * 
from emp 
where rownum <=3;

-- ������ salesman�� ������� �̸�, ������ ����ϴµ� ��µǴ� ������� 2��° �����͸� ����Ͻÿ�. 
select ename, sal 
from (select rownum as ��ȣ, ename, sal
        from emp 
        where job = 'SALESMAN') 
where ��ȣ =2;

-- �츮�� ���̺��� 2�� ° ���� �л��� �̸��� ���̸� ����Ͻÿ�. 
select ename, age 
from (select rownum ��ȣ, ename, age
        from emp18) 
where ��ȣ =2;