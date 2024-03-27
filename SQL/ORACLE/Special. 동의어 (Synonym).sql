���� 1. c##scott ��������  c##smith ������ ����� ������ �� �ִ� ������ �ο��ϰ� c##smith ������ 
�����Ͻÿ�
create user c##smith
identified by tiger;

grant dba to c##smith;

connect c##smith/tiger

select count(*) from c##scott.emp;

���� 2-1. c##scott.emp �� emp��� �ҷ��� �� �� �ְ� �����Ͻÿ�. 
create public synonym emp
for c##scott.emp;

���� 2-2. c##smith ������ c##scott�� dept ���̺�� saglrade ���̺��� ��ȸ�� �� �ְ� �Ͻÿ�.
create public synonym dept 
for c##scott.dept;

create public synonym salgrade 
for c##scott.salgrade;

select count(*) from dept;
select count(*) from salgrade;

���� 3. hr ������ ������ �ִ� ��� ���̺���� c##smith ������ select �� �� �ְ� �Ͻÿ�
-> ���� c##scott ������ �����ؾ� �Ѵ�. 
connect c##scott/tiger 

grant select on dept to c##smith;
grant select on salgrade to c##smith;

���� 4. hr ������ �����ϰ� �ִ� ���̺� ����Ʈ�� Ȯ���Ͻÿ� !
select table_name 
from dba_tables  => db�� ��� table ����Ʈ�� ���� ���� 
where owner='HR'; => ������ 

- ��� ������Ʈ���� ������ �ڵ� ���� 
sqlplus sys/oracle_4U as sysdba

alter user hr 
identified by hr; 

connect c##scott/tiger

grant dba to hr; 

connect hr/hr

���� 5. hr ������ ���̺������ �Ϻη� synonym���� �����Ͻÿ�. 
create public synonym jobs for hr.jobs;
create public synonym employees for hr.employees ;
create public synonym departments for hr.departments;
create public synonym locations for hr.locations;

���� 6. c##scott/tiger ������ �����ؼ� hr ������ ���̺��� jobs�� �Ʒ��� ���� ��ȸ�Ͻÿ�. 
connect c##scott/tiger

select * from jobs; 

���� 7. hr ������ ������ synonym�� ���� �����Ͻÿ�. 
select synonym_name
from all_synonyms
where table_owner = 'HR';

drop public synonym employees;
drop public synonym departments;
drop public synonym jobs;
drop public synonym locations;