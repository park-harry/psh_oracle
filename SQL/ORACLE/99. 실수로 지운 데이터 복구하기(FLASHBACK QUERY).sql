���� 1-1. ���� �ð��� Ȯ���ϱ�
select systimestamp from dual;

���� 1-2. emp ���̺��� ���� ����� commit �Ѵ�. 
delete from emp; 
commit; 

���� 1-3. emp ���̺��� �����Ͱ� �������� 10�� ���� ���¸� Ȯ���Ͻÿ�. 
select * from emp
as of timestamp to_timestamp('2023/12/13 14:56:55',
                            'RRRR/MM/DD HH24:MI;SS');
���� �ð��뿡�� emp ���̺��� �ְ� �����͵� ������ ���� �� �ִ��� Ȯ�������� �ð��� �����ؼ� 
�����Ѵ�. �� �ð����� emp ���̺��� flashback �Ѵ�. 

���� 1-4. emp ���̺��� flashback�� ������ ���·� �����. 
alter table emp 
enable row movement;

select table_name, row_movement 
from user_tables 
where table_name = 'EMP'; 
=> enabled �������� Ȯ���غ��� 

flashback table emp18 
to timestamp to_timestamp('2023/12/13 15:01:55','RRRR/MM/DD HH24:MI;SS');

���� 1-5. dept ���̺��� ���� delete �ϰ� commit �� �Ŀ� flashback query�� dept ���̺��� 
�������� ���� �����͸� ��� Ȯ���Ͻÿ�.
select systimestamp from dual;
23/12/13 15:16:25.733000000 +09:00

delete from dept;
commit;

select * from dept 
as of timestamp to_timestamp('2023/12/13 15:14:25',
                             'RRRR/MM/DD HH24:MI;SS');
                             
���� 1-6. ������ Ȯ���� �ð����� dept ���̺��� flashback table �ؼ� �����Ͻÿ�. 
alter table dept 
enable row movement;

select table_name, row_movement 
from user_tables 
where table_name = 'DEPT';

flashback table dept 
to timestamp to_timestamp('2023/12/13 15:14:25',
                             'RRRR/MM/DD HH24:MI;SS');
                             
���� 2. ��� ���̺��� ������ ��� 0���� �����ϰ� commit �Ͻÿ�. 
update emp
set sal =0;
commit;

-- ���� �����͸� ���� �Ͻÿ�. 
select systimestamp from dual;
23/12/13 15:25:45.288000000 +09:00

select * from emp 
as of timestamp to_timestamp('23/12/13 15:23:45',
                            'RRRR/MM/DD HH24:MI:SS');

alter table emp 
enable row movement;

flashback table emp 
to timestamp to_timestamp('23/12/13 15:23:45',
                            'RRRR/MM/DD HH24:MI:SS');  