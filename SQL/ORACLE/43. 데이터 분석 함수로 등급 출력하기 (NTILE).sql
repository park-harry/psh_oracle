-- �̸��� ���ް� ���޿� ���� ����� ����Ͻÿ�. (���޿� ���� ����� 4������� ������ ��� �ο�) 
select ename, sal, ntile(4) over (order by sal desc) ���
from emp;

-- ���� ����� �ٽ� ����ϴµ� ������ 5������� ������ ����Ͻÿ�. 
select ename, sal, ntile(5) over (order by sal desc) ���
from emp;

-- �츮�ݿ��� ��Ż簡 kt�� �л����� �̸��� ���̰� ����� ����ϴµ� ����� 3������� ������ ����Ͻÿ�. (����� ���̿� ���� ���) 
select ename, age, ntile(3) over (order by age desc) ���
from emp18 
where telecom = 'kt';

-- �츮�ݿ��� ��Ż簡 kt, sk �� �л����� �̸��� ���̿� ���̿� ���� ����� ����ϴµ� ����� 5������� ������ ����Ͻÿ�. 
-- (���̿� ���� ���) 
select ename, age, ntile(5) over (order by age desc) ���
from emp18 
where telecom in('kt','sk');
