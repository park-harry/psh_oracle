-- �̸�, ����, ���޿� ���� ����, ������ ���� ������ ����Ͻÿ�. 
select ename, sal, rank() over (order by sal desc) ����, 
                   round(rank() over (order by sal desc)/14,2) ����
from emp;

-- ȸ���� ������ ���̽��� ���� �� �ð����� �����Ͱ� ��� insert �ǰ� �����Ƿ� ���� ���� 14��� �� �� ����.
-- �׷��ٰ� count(*) �� ���� ������ �߻��Ѵ�. �׷��� �ʿ��� ������ �м��Լ��� cume_dist�̴�. 
select ename, sal, rank() over(order by sal desc) ����, 
                    round(cume_dist() over (order by sal desc),2) ����
from emp;