-- �츮 �� ���̺��� ��õ ���������� �����ϴ� �л��� �̸��� �ּҸ� ����Ͻÿ�. 
select ename, address 
from emp18 
where trim(address) = '��õ ������';

-- �츮 �� ���̺��� �̸����� ����ϴµ� �̸��� ���� .com �� �߶󳻼� ����Ͻÿ�. 
select email, rtrim(email,'.com')
from emp18;

-- ���� ����� �ٽ� ����ϴµ� .net�� �߶󳻽ÿ�. 
select email,rtrim(rtrim(email, '.com'),'.net')
from emp18;
-- kimjunhwan11@nate.com -> kimjunhwan11@na �� ���´� 
-- .net �߿� ��� �ϳ��� ö�ڰ� ������ �� �߶󳽴�. 