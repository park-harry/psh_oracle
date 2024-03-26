-- �̸��� scott�� ����� ������ 5600���� �����Ͻÿ�. 
update emp 
set sal = 5600
where ename = 'SCOTT';

-- ������ salesman�� ������� Ŀ�̼��� 9000���� �����Ͻÿ�. 
update emp 
set comm = 9000
where job = 'SALESMAN';

-- ������ 2000 �̻��� ������� �μ���ȣ�� 10������ �����Ͻÿ�. 
update emp 
set deptno = 10 
where sal >= 2000;

-- ��� ���̺��� ������ ��� 0���� �����Ͻÿ�. 
update emp 
set sal = 0; 

-- commit �ϱ� ���� ����ϱ� 
rollback;

// �߸� commit �ؼ� ������ ���� �ϴ� ��� -> ����Ŭ�� Ÿ�Ӹӽ� ��� ����ϱ� 
-- emp ���̺��� flashback�� ������ ���·� ���� 
alter table emp enable row movement;

select table_name, row_movement from user_tables
where table_name = 'EMP';

-- ���� �ð����� 19�� ������  emp ���̺��� �ǵ�����. 
flashback table emp to timestamp 
(systimestamp - interval '19' minute);

-- flashback�� ������ �ð��� Ȯ���Ͻÿ�. 
select name, value 
from v$parameter 
where name ='undo_retention'; 
