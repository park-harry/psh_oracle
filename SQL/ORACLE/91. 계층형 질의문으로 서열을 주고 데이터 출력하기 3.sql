-- ��� ���̺� ��ü�� ������ ����Ͻÿ�. 
select rpad(' ', level*3) || ename as employee, level, sal 
from emp
start with mgr is null 
connect by prior empno = mgr;

-- ���� ����� �ٽ� ����ϴµ� ������ ���� �������� ����Ͻÿ�. 
select rpad(' ', level*3) || ename as employee, level, sal 
from emp
start with mgr is null 
connect by prior empno = mgr
order by sal desc;

-- �ٽ� ���� ����� ����ϴµ� ������ Ʋ�� �� �����ϸ鼭 ����Ͻÿ�. 
select rpad(' ', level*3) || ename as employee, level, sal 
from emp
start with mgr is null 
connect by prior empno = mgr
order siblings by sal desc;

-- ���� ����� �ٽ� ����ϴµ� �̹����� �̸�, level, �Ի����� ����ϰ� �ֱٿ� �Ի��� ��� ������
-- ����ϵ�, ������ Ʋ�� ���߸��� ���ÿ�. 
select rpad(' ', level*3) || ename as employee, level, hiredate 
from emp
start with mgr is null 
connect by prior empno = mgr
order siblings by hiredate desc;

