-- 2017�⵵���� �����ߴµ� 2022�⿡ ����� ��Ÿ���� ������ �� ����� ����Ͻÿ�. 
select count(*) from 
(select ��ȣ�� 
from market_2017
where ��ȣ�� like '%��Ÿ����%'
minus
select ��ȣ�� 
from market_2022
where ��ȣ�� like '%��Ÿ����%');



