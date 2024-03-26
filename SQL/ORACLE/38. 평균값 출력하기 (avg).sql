-- ��� ���̺��� ��� ������ ����Ͻÿ�. 
select round(avg(sal)) 
from emp;

--����, ������ ��� ������ ����Ͻÿ�. 
select job, round(avg(sal)) as avgsal
from emp
group by job;

-- ���� ����� �ٽ� ����ϴµ� ������ ��� ������ ���� �ͺ��� ����Ͻÿ�. 
select job, round(avg(sal)) as avgsal
from emp
group by job
order by avgsal desc;

-- ���� ����� �ٽ� ����ϴµ� ������ salesman�� �����ϰ� ����Ͻÿ�. 
select job, round(avg(sal)) as avgsal
from emp
where job <> 'SALESMAN'
group by job
order by avgsal desc;

-- �μ���ȣ, �μ���ȣ �� ��տ����� ����ϴµ� �μ���ȣ�� 20�� �μ��� �����ϰ� 
-- �μ���ȣ �� ��տ����� ���� �ͺ��� ����Ͻÿ�. 
select deptno, round(avg(sal)) as avgsal 
from emp 
where deptno <> 20 
group by deptno
order by avgsal desc;

-- �ּҸ� ����ϰ� �� ���� �ּ��� �� ������ ��µǰ� �Ͻÿ�. 
select address, regexp_substr(address,'[^ ]+',1,1)
from emp18;
--> regexp_substr(address,'[^ ]+',1,1) : ������ �ƴ� (^) ���� �� (+) �ִ� �͵��� ù ���ں��� �о �߶󳻶�� �� 

-- ���� regexp_substr�� �̿��ؼ� �ּҿ� �ּ� �� ��� ���̸� ����Ͻÿ�. 
select regexp_substr(address,'[^ ]+',1,1) as �ּ�, round(avg(age))
from emp18
group by regexp_substr(address,'[^ ]+',1,1);

-- ���� sql�� decode�� �̿��ؼ� �ּҿ� �ּҺ� ��� ���̸� ���Ͻÿ�. 
select decode(regexp_substr(address,'[^ ]+',1,1),'����Ư����','�����', '����','�����',regexp_substr(address,'[^ ]+',1,1)) as �ּ�, round(avg(age))
from emp18
group by decode(regexp_substr(address,'[^ ]+',1,1),'����Ư����','�����', '����','�����',regexp_substr(address,'[^ ]+',1,1));

-- �̸��� Ŀ�̼� ��� 
select ename, comm 
from emp;

-- Ŀ�̼� ��հ� ��� 
select avg(comm) 
from emp;
--> group �Լ��� null ���� �����Ѵ�. �׷��Ƿ� ���� �Լ����� Ŀ�̼��� �� ���ؼ� Ŀ�̼��� null�� �ƴ� 4���� ������ ������. 
--> ��� ���� ����� �� null ó���� ��� �ؾ� ���� �����ϸ鼭 sql�� �ۼ��ؾ� �Ѵ�. 