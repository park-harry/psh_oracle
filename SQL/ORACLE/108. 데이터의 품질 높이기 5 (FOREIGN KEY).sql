���� 1. demo ��ũ��Ʈ�� ������ emp ���̺��� �ʱ�ȭ ��Ű�� dept ���̺��� deptno �� primary key 
������ �Žÿ�. 
alter table dept 
add constraint dept_deptno_pk primary key(deptno);

���� 2-1. emp ���̺� deptno�� foreign key ������ �ɸ鼭 dept ���̺� deptno�� �����϶�� �Ͻÿ�. 
alter table emp 
add constraint emp_deptno_fk foreign key(deptno) references dept(deptno);

=>���� ��ɾ �����Ϸ��� dept ���̺��� deptno�� primary key ������ �ɷ��־�� �Ѵ�.

���� 2-2. emp ���̺� �μ���ȣ 70���� �Է��غ��ÿ�. 
 insert into emp(empno, ename, sal, deptno)
values(1234, 'aaa',4000,70);

=>���Ἲ �������� ����: �θ� key�� ���ٴ� error�� ����. 

���� 2-3. dept ���̺� �μ���ȣ 10���� �����Ͻÿ�. 
delete from dept 
where deptno=10;
=> ���Ἲ �������� ����: �ڽ� ���ڵ尡 �߰ߵǾ��ٴ� error�� ����. 

���� 3. �Ʒ��� ���̺��� �����ϸ鼭 primary key ������ �Žÿ�. 
- ���̺��: dept700
- �÷���: deptno, loc, dname (deptno�� primary key ����) 
create table dept700 
( deptno  number(10),
loc  varchar2(10),
dname varchar2(10),
constraint dept700_deptno_pk primary key(deptno));

���� 4. �Ʒ��� ���̺��� �����ϴµ� dept700�� deptno�� �����϶�� �Ͻÿ�. 
- ���̺��: emp700
- �÷���: empno, ename, sal, deptno (deptno�� foreign key ����) 
create table emp700
( empno number(10), 
ename varchar2(10),
sal number(10),
deptno number(10), 
constraint emp700_deptno_fk foreign key(deptno) references dept700(deptno));

[dba�� ���� �� �ϳ��� etl ����]
���� 5-1. dept ���̺��� ��� �����͸� dept700 ���̺� �Է��Ͻÿ�. 
insert into dept700(deptno, loc, dname) 
select deptno, loc, dname 
from dept;

commit;

���� 5-2. emp ���̺��� empno, ename, sal, deptno�� ��� �����͸� emp700 ���̺� �����Ͻÿ�. 
insert into emp700(empno, ename, sal, deptno) 
select empno, ename, sal, deptno 
from emp;
=> ���࿡ ���ݵǴ� �����Ͱ� ���� ������ �� �Է��� �ȴ�. 

���� 6. telecom_table�� telecom�� primary key ������ �Žÿ�. 
alter table telecom_table 
add constraint telecom_table_telecom_pk primary key(telecom);

- �ߺ��� ������ �����
select rowid, t.*
from telecom_table t;

delete from telecom_table 
where rowid = '�ߺ��� �Ǵ� rowid';

���� 7. emp18 ���̺��� telecom�� foreign key ������ �ɸ鼭 telecom_table�� telecom�� 
�����ϰڴٰ� �Ͻÿ�. 
update emp18 
set telecom = lower(telecom);
=> ��� �ҹ��ڷ� �ٲ�� ������ �ȴ�. 

alter table emp18 
add constraint emp18_telecom_fk foreign key(telecom) references telecom_table(telecom);


1. on delete cascade �ɼ�: dept ���̺��� deptno�� ����� emp ���̺��� deptno �� ���� 
													�������� �ɼ� 
2. on delete set null �ɼ�: dept ���̺��� deptno�� ����� emp ���̺��� null�� ���� �Ǵ� �ɼ� 
			
���� 8-1. dept ���̺��� �θ� �ڽ� ���踦 ��� �����Ͻÿ�. primary key ����� foreign key ������ 
��� �����Ͻÿ�. 
alter table dept 
drop constraint dept_deptno_pk cascade;

���� 8-2. �̹����� on delete cascade �ɼ��� �Ἥ �ٽ� �θ� �ڽ� ���踦 �����Ͻÿ�. 
alter table dept 
add constraint dept_deptno_pk primary key(deptno);

alter table emp 
add constraint emp_deptno_fk foreign key(deptno) references dept(deptno)
on delete cascade;

���� 9-1. dept ���̺��� �μ���ȣ 10���� ����ÿ�. 
delete from dept 
where deptno = 10;

select * from emp;
=> dept ���̺��� �μ� ��ȣ 10���� �������� emp ���̺��� �μ���ȣ 10���� �� ��������. 
rollback;

���� 9-2. �̹����� on delete set null�� �׽�Ʈ �Ͻÿ�. 
alter table dept 
drop constraint dept_deptno_pk cascade;
=> ���� ����� 

alter table dept 
add constraint dept_deptno_pk primary key(deptno);

alter table emp 
add constraint emp_deptno_fk foreign key(deptno) references dept(deptno)
on delete set null;

delete from dept 
where deptno = 10;

select * from emp;
=> dept ���̺��� �μ� ��ȣ 10���� �������� emp ���̺��� �μ���ȣ 10�� �����ʹ� null ������ �ٲ�.

���� 10. foreign key ���� ���� �� column level, table level �� �������� test �Ͻÿ�. 
- table level 
create table dept901
(deptno number(10),
loc varchar2(10),
dname varchar2(10),
constraint dept901_deptno_pk primary key (deptno));

create table emp901
(ename varchar2(10),
deptno number(10),
constraint emp901_deptno_fk foreign key(deptno) references dept901(deptno));

- column level 
create table dept902
(deptno number(10) constraint dept902_deptno_pk primary key,
loc varchar2(10),
dname varchar2(10)
);

create table emp902
(ename varchar2(10),
deptno number(10) constraint emp902_deptno_fk references dept902(deptno)); 