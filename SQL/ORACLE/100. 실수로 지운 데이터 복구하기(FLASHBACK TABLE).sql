���� 1-1. salgrade ���̺��� delete �ϰ� commit �Ͻÿ�. 
select systimestamp from dual;
23/12/13 15:47:15.580000000 +09:00

delete from salgrade;
commit;

���� 1-2. salgrade ���̺��� flashback table�� ���� �ϴµ� ���� �ð����� 5�� ������ �ǵ����ÿ�. 
alter table salgrade 
enable row movement;

flashback table salgrade 
to timestamp (systimestamp - interval '5' minute);

���� 2-1. market_2017�� delete�ϰ� commit �Ͻÿ�. 
delete from market_2017;
commit; 

���� 2-2. market_2017�� flashback table�� �����Ͻÿ�. 
alter table market_2017 
enable row movement;

flashback table market_2017
to timestamp(systimestamp - interval '3' minute);

=> delete �� �����ʹ� flashback ���� �ǵ��� �� ������ truncate�� �����ʹ� �ǵ����� ���Ѵ�. 