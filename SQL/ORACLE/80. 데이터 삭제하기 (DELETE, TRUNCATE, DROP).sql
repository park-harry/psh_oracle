-- ������ salesman�� ������� ��� ���̺��� ����ÿ�. 
delete from emp 
where job = 'SALESMAN';

-- ��� ���̺��� Ŀ�̼��� null�� ������� ����ÿ�. 
delete from emp 
where comm is null;

-- ��� ���̺��� ��� �����͸� ����� commit �Ͻÿ�. �׸��� ���̺��� ���� ��Ű�ÿ�. 
delete from emp;
commit;

alter table emp enable row movement;

select table_name, row_movement from user_tables 
where table_name = 'EMP';

flashback table emp to timestamp 
(systimestamp - interval '5' minute);

-- emp18 ���̺��� ����� ����� emp18 ���̺��� drop �Ͻÿ�. 
create table emp18_backup 
as 
select * from emp18;

drop table emp18;

-- flashback ���� ���̺��� �����ϴµ� ������ �ӿ� emp18�� �ִ��� Ȯ���ϰ� �ִٸ�, �����뿡�� �����Ͻÿ�.  
show recyclebin;

flashback table emp18 to before drop;

truncate table emp18;

--emp18_backup ���̺��� �����͸� emp18 ���̺� �Է��Ͻÿ�. 
insert into emp18 
select * from emp18_backup;