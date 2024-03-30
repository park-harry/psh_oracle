���� 1-1. �Ʒ��� ���� unique ������ �ɾ ���̺��� �����Ͻÿ�. 
create table emp55
( empno number(10),
ename varchar2(10) constraint emp55_ename_un unique,
sal number(10));

���� 1-2. �̹����� table level�� �����Ͻÿ�. 
create table emp56
(empno number(10),
ename varchar2(10),
sal number(10),
constraint emp56_ename_un unique(ename));

���� 1-3. ��� ���̺��� ename�� unique ������ �Žÿ�. 
alter table emp 
add constraint emp_ename_un unique(ename);

���� 2. �Ʒ��� ���̺��� �����ϸ鼭 ������ �����Ͻÿ�. 
- ���̺��: emp57
- �÷���: empno, ename, sal, hiredate (sal���ٰ� unique ���� �ɱ�) 
create table emp57
(empno number(10),
ename varchar2(10), 
sal number(10) constraint emp57_sal_un unique, 
hiredate date);

���� 3-1. �츮�� ���̺� ename�� unique ������ �Žÿ�. 
alter table emp18
add constraint emp18_ename_un unique(ename);

���� 3-2. �츮�� ���̺� ename�� �ɸ� unique ������ �����Ͻÿ�. 
alter table emp18 
drop constraint emp18_ename_un;