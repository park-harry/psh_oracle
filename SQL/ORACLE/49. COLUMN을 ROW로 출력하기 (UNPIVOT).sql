-- �Ʒ��� ���� sql�� �ۼ� ��, ��ǰ�� ���鰳�� �ڵ尡 �ʹ� �������. 
select sum(bicycle), sum(camera), sum(notebook)
from order2;

-- column�� row�� �ٲٱ� 
select * from order2
unpivot( ���� for ������ in (bicycle, camera, notebook));

select * from order2;

-- ���� unpivot ���� ����� ���̺��� �����Ѵ�. (dba���� Ư��) 
create table order3 as
select * 
from order2 
unpivot (���� for ������ in (bicycle, camera, notebook));
commit;

select ������, sum(����)
from order3
group by ������; 

-- unpivot ���� �̿��ؼ� crime_time�� column�� row�� �����Ͻÿ�. 
select * from crime_time
unpivot(�Ǽ� for �ð� in (f0t3,f3t6,f6t9,f9t12,f12t15,f15t18,f18t21,f21t24));

-- ���� ����� crime_time2 ��� ���̺�� �����Ͻÿ�. 
create table crime_time2 
as
select * from crime_time
unpivot(�Ǽ� for �ð� in (f0t3,f3t6,f6t9,f9t12,f12t15,f15t18,f18t21,f21t24));
commit;

-- ������ ���� ���� �Ͼ�� �ð��븦 ����Ͻÿ�. 
select �ð�
from crime_time2 
where crime_type = '����'
order by �Ǽ� desc fetch first 1 row only;

-- ��ȭ�� ���� ���� �Ͼ�� �ð��� ���� 1���� 2���� ����Ͻÿ�. 
select �ð�
from crime_time2 
where crime_type = '��ȭ'
order by �Ǽ� desc fetch first 2 row only;