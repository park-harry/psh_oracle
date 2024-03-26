-- ������ SALESMAN�� ������� �̸�, ����, ������ ����ϴµ� �տ� ��ȣ�� ������� �ο��ؼ� ����Ͻÿ�. 
select ename, sal, job 
from emp 
where job = 'SALESMAN';

-- ���� ����� �ٽ� ����ϴµ� ������ ���� ������� ����ϴµ� ��ȣ�� 1,2,3,4 ������
-- ��µǰ� �Ͻÿ�. 
select rownum, ename, sal, job 
from (select ename, sal, job 
        from emp 
        where job = 'SALESMAN'
        order by sal desc);

-- ���� ���� from ���� ���� ������ �̿����� �ʰ� row_number( ) �Լ��� �̿��ؼ� ���� ����� ����Ͻÿ�. 
select row_number() over (order by sal desc) ��ȣ, ename ,sal, job 
from emp 
where job = 'SALESMAN';

-- ��Ż簡 KT �� �л����� �̸��� ���̿� ��Ż縦 ����ϴµ� ���̰� ���� �л����� ����ϰ� �տ� ��ȣ�� �ٿ��� ����Ͻÿ�. 
select row_number() over (order by age desc) ��ȣ, ename, age, telecom
from emp18
where telecom = 'kt';

-- ��Ż簡 kt �� �л� �߿��� ���̰� 2��°�� ���� �л��� ����Ͻÿ�. 
select ��ȣ, ename, age, telecom 
from (select row_number() over (order by age desc) ��ȣ, ename, age, telecom
        from emp18
        where telecom = 'kt')
        where ��ȣ=2;

-- ��� ���̺��� ������ 5��°�� ���� �޴� ����� �̸��� ������ ����Ͻÿ�. 
select ��ȣ, ename, sal
from (select row_number() over (order by sal desc) ��ȣ, ename, sal 
        from emp)
where ��ȣ = 5;
        
