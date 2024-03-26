-- �̸�, ����, ���ʽ��� ����ϴµ� ������ 3000 �̻��̸� ���ʽ��� 9000, ������ 1000 �̻��̰� 
-- 3000 ���� ������ ���ʽ��� 2000, �������� 0
select ename, sal, 
case when sal >= 3000 then 9000
    when sal between 1000 and 3000 then 2000 
    else 0 end as bonus 
from emp;

-- �̸�, �μ���ȣ, ���ʽ��� ����ϴµ� ���ʽ��� �μ���ȣ 10�̸� 9000, �μ���ȣ 20�̸� 6000,
-- ������ �μ���ȣ�� 0�� ����Ͻÿ�. (case �� ���) 
select ename, deptno, 
case when deptno=10 then 9000
    when deptno=20 then 6000
    else 0 end as bonus 
from emp;

-- �̸�, Ŀ�̼�, ���ʽ��� ����ϴµ� Ŀ�̼��� null �̸� ���ʽ��� 7000, Ŀ�̼��� null �� �ƴϸ� 
-- ���ʽ��� 5000�� ����Ͻÿ�. 
select ename, comm, 
case when comm is null then 7000
    else 5000 end as bonus 
from emp;

-- �̸��� Ŀ�̼��� ����ϴµ� Ŀ�̼��� ���� ������� ���� ��������� ����Ͻÿ�. 
select ename, comm 
from emp 
order by comm desc; --> desc�� �Ἥ null ������ ���� �ö�´�. 

-- ���� ����� �ٽ� ����ϴµ� null ���� �Ʒ��� �����ÿ�. 
select ename, comm 
from emp 
order by comm desc nulls last;

-- �̸�, ������ ��ȣ (mgr)�� ����ϴµ� mgr�� ���� ������ ��µǰ� �ϰ� null �� �� �Ʒ���
-- ����Ͻÿ�. 
select ename, mgr 
from emp 
order by mgr desc nulls last;