-- Ŀ�̼��� null�� ������� �̸��� Ŀ�̼��� ����Ͻÿ�. 
select ename, comm
from emp
where comm is null;

-- �Ʒ��� ������ ��µ��� �ʴ´�. 
select ename, comm
from emp
where comm = null;
-- null ���� �� �� ���� ���̱� ������ '='�δ� �� �� �� ����. 

-- Ŀ�̼��� null�� �ƴ� ������� �̸��� Ŀ�̼��� ����Ͻÿ�. 
select ename, comm
from emp
where comm is not null;