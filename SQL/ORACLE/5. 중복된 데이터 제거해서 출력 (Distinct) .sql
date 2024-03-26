-- ��� ���̺��� ������ ����Ͻÿ� 
select job from emp; 

-- ��� ���̺��� �ߺ��� ������ �����ϰ� ����Ͻÿ� 
select distinct job from emp; 

-- ��� ���̺��� �μ���ȣ�� ����ϴµ� �ߺ��� �����ؼ� ����Ͻÿ�. 
select distinct deptno 
from emp;

-- �츮�� ���̺� (emp18)���� ��Ż縦 ����ϴµ� �ߺ��� �����ؼ� ����Ͻÿ�. 
select distinct telecom
from emp18; 

-- ��� ���̺��� �ߺ��� ���ŵ� �μ���ȣ�� ������ ����Ͻÿ�. 
select distinct deptno, job 
from emp;

-- �츮�� ���̺��� ������ ����ϴµ� �ߺ��� �����ؼ� ����Ͻÿ�. 
select distinct major
from emp18;

-- �츮�� ���̺��� ������ �Ʒ��� ���� ����Ͻÿ�. 
-- ex) ����� �л��� ������ ���� �̰� ��Ż�� KT �̸�, ��⵵ ���ֽÿ��� ��� �ֽ��ϴ�. 
-- �÷��� �� information ���� ���
select ename || ' �л��� ������ ' || gender || '���̰�, ��Ż�� '|| telecom || '�̸�, ' 
|| address || '���� ��� �ֽ��ϴ�' 
from emp18; 

-- ��� ���̺��� ������ ��ȣ (mgr)�� ����ϴµ� �ߺ��� �����ؼ� ����Ͻÿ�. 
select distinct mgr
from emp; 