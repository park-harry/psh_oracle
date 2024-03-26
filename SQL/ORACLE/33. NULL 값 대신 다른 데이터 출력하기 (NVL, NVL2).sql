-- �̸��� ����, Ŀ�̼�, ���� + Ŀ�̼��� ����Ͻÿ�. 
select ename, sal, comm, sal+comm
from emp;

-- �̸��� ����, Ŀ�̼��� ����ϴµ� Ŀ�̼��� null�� ������� 0���� ����Ͻÿ�. 
select ename, sal, nvl(comm,0)
from emp;

-- �̸�, ������ ����ϴµ� ������ null �� ������� no job���� ����Ͻÿ�. 
select ename, nvl(job,'no job')
from emp;

-- (���̵� ��) �̸�, ����, Ŀ�̼��� ����ϴµ� Ŀ�̼��� NULL �� ������� NO COMM�̶�� 
-- �۾��� ����Ͻÿ�.
select ename, sal, nvl(TO_CHAR(comm),'NO COMM')
from emp;

-- �̸�, ����, Ŀ�̼�, ���� + Ŀ�̼��� ����Ͻÿ�. (nvl2)
select ename, sal, comm,nvl2(comm, sal+comm, sal)
from emp;

-- �̸�, mgr�� ����ϴµ� mgr�� null ����� no manager�� ��µǰ� �Ͻÿ�. (nvl�� nvl2) 
select ename, nvl(to_char(mgr),'no manager') 
from emp;

select ename, nvl2(to_char(mgr), to_char(mgr), 'no manager') 
from emp;