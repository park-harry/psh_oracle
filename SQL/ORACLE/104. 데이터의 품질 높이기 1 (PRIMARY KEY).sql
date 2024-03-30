���� 1-1. ������ ���� ���̺��� �����ϸ鼭 empno�� primary key ������ �ɾ �����Ͻÿ�. 
create table emp51 
(empno  number(10) primary key, 
ename   varchar2(10));

���� 1-2. null ���� emp51�� empno�� �Է��غ���. 
insert into emp51(empno, ename) 
values(1111,'scott');
insert into emp51(empno, ename) 
values(null,'smith');
=> null ���� �������� �ϸ� error�� �߻��Ѵ�. 

���� 1-3. �ߺ��� �����Ͱ� �Է� �ȵǴ��� Ȯ���Ѵ�. 
insert into emp51(empno, ename) 
values(1111,'allen');

���� 2-1. �ٽ� �ߺ��� �����Ϳ� null ���� �Է��ؾ� �Ǽ� primary key ������ �����ϰ� �ʹ�. 
- ���� �̸� Ȯ���ϱ� 
select t.table_name, t.constraint_name, c.column_name 
from user_constraints t, user_cons_columns c 
where t.constraint_name = c.constraint_name and t.table_name = 'EMP51';

���� 2-2. primary key ���� �����ϱ� 
alter table emp51 
drop constraint SYS_C008581;

���� 2-3. ���� �̸��� �ǹ��ְ� �����ϵ��� �ٽ� ���̺�� ������ �����Ͻÿ�. 
drop table emp51;

create table emp51 
(empno  number(10) constraint emp51_empno_pk primary key, 
ename   varchar2(20));

select t.table_name, t.constraint_name, c.column_name 
from user_constraints t, user_cons_columns c 
where t.constraint_name = c.constraint_name and t.table_name = 'EMP51'; 

���� 2-4. primary key ���� �����ϱ�
alter table emp51 
drop constraint emp51_empno_pk;

���� 3-1. �Ʒ��� ���̺��� ����� �Բ� �����Ͻÿ�. 
- ���̺�� : emp52 
- �÷��� : empno, ename, sal, hiredate (empno�� primary key ����)

create table emp52 
(empno number(10) constraint emp52_empno_pk primary key ,
 ename  varchar2(20),
 sal  number(10),
 hiredate  date); 

���� 3-2. emp52 ���̺� �Ʒ��� �����͸� �Է��Ͻÿ�. 
- empno: 1111, ename: allen, sal: 3000, hiredate: 2023/12/14

insert into emp52(empno, ename, sal, hiredate)
 values(1111, 'allen', 3000, '2023/12/14');

���� 3-3. emp52�� empno�� �ߺ��� �����Ϳ� null ���� �ԷµǴ��� Ȯ���Ͻÿ�. 
insert into emp52(empno, ename, sal, hiredate)
 values(1111, 'smith', 2000, '2023/12/13');

insert into emp52(empno, ename, sal, hiredate)
 values(null, 'smith', 2000, '2023/12/13');

���� 4. �츮�� ���̺��� empno�� primary key ������ �Žÿ�. 
alter table emp18 
add constraint emp18_empno_pk primary key(empno);