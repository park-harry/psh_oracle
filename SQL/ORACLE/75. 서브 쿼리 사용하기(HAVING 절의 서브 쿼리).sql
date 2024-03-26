-- ����, ������ �� ������ ����Ͻÿ�. 
select job, sum(sal) 
from emp 
group by job;

-- ���� ����� �ٽ� ����ϴµ� ������ �� ������ 5000 �̻��� ����� ����Ͻÿ�. 
select job, sum(sal) 
from emp 
group by job
having sum(sal) >= 5000;

-- ������ ������ �� ������ ����ϴµ� ������ �� ������ ������ salesman�� ������� 
-- �� ���޺��� �� ū �͸� ����Ͻÿ�. 
select job, sum(sal) 
from emp 
group by job
having sum(sal) > (select sum(sal) from emp where job = 'SALESMAN');

-- ��Ż�, ��Ż� �� �ο����� ����ϴµ� ��Ż� �� �ο����� LG�� �ο������� �� ū�͸� ����Ͻÿ�. 
select telecom, count(*) 
from emp18 
group by telecom 
having count(*) > (select count(*) from emp18 where telecom = 'lg');