	
���� 1. ������ ���̺��� not null ������ �ɾ �����Ͻÿ�. 
create table emp61
(empno   number(10) constraint emp61_empno_nn not null,
 ename varchar2(10));

insert into emp61(empno, ename)
 values(null,'scott');

���� 2. ������ ���� table level�� ������ �ɸ� �������� �ʴ��� Ȯ���Ͻÿ�. (OCP ���� ����) 
create table emp62
(empno number(10),
ename varchar2(10),
constraint emp62_empno_nn not null(empno));

���� 3. emp ���̺��� sal�� not null ������ �Žÿ�. 
alter table emp 
modify sal constraint emp_sal_nn not null;

���� 4. �츮�� ���̺��� ename�� not null ������ �Žÿ�. 
alter table emp18 
modify ename constraint emp18_ename_nn not null;

���� 5. dept ���̺� loc �÷��� not null ������ �Žÿ�. 
alter table dept 
modify loc constraint dept_loc_nn not null;

���� 6. dept ���̺��� 20�� �μ���ȣ�� loc�� null�� �����Ͻÿ�. 
update dept 
set loc = null 
where deptno = 20;
