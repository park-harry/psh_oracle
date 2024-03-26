-- ������ ���غ��� 
select deptno, sum(sal) 
from emp 
where deptno in (10,20)
group by deptno
intersect 
select deptno, sum(sal) 
from emp 
where deptno in (20,30)
group by deptno;

-- market_2017���� ��ȣ�� ī�亣�װ� ���Ե� ��ȣ���� �󰡾��ҹ�ȣ, ��ȣ���� ����Ͻÿ�. 
select �󰡾��ҹ�ȣ, ��ȣ��
from market_2017
where ��ȣ�� like '%ī�亣��%';

-- market_2017�� market_2022�� �������� ���ؼ� 2017�⵵���� �����ߴµ� 2022�⵵���� �ִ� 
-- ī�亣���� ��ȣ��, �󰡾��ҹ�ȣ�� ����Ͻÿ�. 
select �󰡾��ҹ�ȣ, ��ȣ��
from market_2017
where ��ȣ�� like '%ī�亣��%'
intersect 
select �󰡾��ҹ�ȣ, ��ȣ��
from market_2022
where ��ȣ�� like '%ī�亣��%';