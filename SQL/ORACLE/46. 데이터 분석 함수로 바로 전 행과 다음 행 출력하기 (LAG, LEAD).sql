-- ��� ��ȣ, ��� �̸�, �ٷ� ������ �����ȣ, �ٷ� �������� �����ȣ�� ����Ͻÿ�. 
select empno, ename,
lag(empno,1) over (order by empno) ����, 
lead(empno,1) over (order by empno) ������
from emp;

-- �̸�, �Ի���, �ٷ� ������ �Ի����� ����Ͻÿ�. (�Ի����� ascending �ϰ� ����Ͻÿ�.) 
select ename, hiredate, 
lag(hiredate,1) over(order by hiredate) ����
from emp;

-- �̸�, �Ի���, �ٷ� ���� �Ի��� ��� ������ ���� �Ŀ� �Ի��ߴ��� ����Ͻÿ�. 
select ename, hiredate, 
hiredate - lag(hiredate,1) over (order by hiredate) "�Ի� ����"
from emp; 