-- ��� ���̺��� �̸��� ������ ����ϴµ� ������ ���� ������� ����ϰ� ��µ� ������� 
-- �ι�° ����� ����Ͻÿ�. 
select ename, sal 
from emp 
order by sal desc fetch first 2 rows only;

-- �μ���ȣ�� 20���� ������� �̸�, �Ի����� ����ϴµ� �ֱٿ� �Ի��� ������� ����ϰ� 
-- ���� 3���� �ุ ����Ͻÿ�.
select ename, hiredate 
from emp 
where deptno = 20 
order by hiredate desc fetch first 3 rows only;