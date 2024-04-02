�� %rowtype�� �̿��ؼ�  ���ڵ� ������ �����ϸ� ������ ����� �̿��� �� �ִ�.
1. 
select * into ���ڵ� ������ 
from emp where 
empno = v_empno;

2. 
update emp
set row = ���ڵ� ������
where empno = v_empno;

3. 
insert   into  emp  
values  ���ڵ� ������;


������ ����
- emp -> emp_test

���� 1. emp ���̺�� �Ȱ��� emp_test ��� ���̺�� �����ϴµ� �����ʹ� �������� ���� ������ 
�����Ͻÿ�.
create   table   emp_test
as
select  *
from   emp
where  1= 2;

���� 1. �����ȣ�� ������ϰ� �����ȣ�� �Է��ϸ� �ش� ����� ��� �����Ͱ� emp_test ���̺� 
�ԷµǴ� PL/SQL �ڵ带 �ۼ��Ͻÿ�
accept  p_empno   prompt  '�����ȣ�� �Է��ϼ��� ~' 
declare
    v_empno      emp.empno%type :=  &p_empno;
    v_emp          emp%rowtype;  -> emp ���̺��� �÷��� ��� ������ Ÿ���� �״�� �����ڴ�.
begin                                    
    select   *   into   v_emp
    from   emp
    where   empno  = v_empno;
    
    v_emp.sal :=  0 ;
    insert   into    emp_test   values    v_emp;
end;
/
select * from emp_test;


���� 2. dept ���̺��� ������ ������ �ִ� dept_backup ���̺��� ������ ���� �����ϰ� �μ���ȣ�� 
����� �ϰ� �μ���ȣ�� �Է��ϸ� �ش� �μ���ȣ�� ��� ����  dept ���̺��� ã�Ƽ� dept_backup 
���̺� �Էµǰ� PL/SQL �ڵ带 �ۼ��Ͻÿ�.

create table dept_backup
as 
    select * 
    from dept 
    where 1=2;

set serveroutput on 
accept p_deptno prompt '�μ���ȣ�� �Է��Ͻÿ�.'
declare 
    v_deptno dept.deptno%type := &p_deptno;
    v_dept dept%rowtype;
begin 
    select * into v_dept 
    from dept 
    where deptno = v_deptno;
    
    insert into dept_backup values v_dept;
end;
/

select * from dept_backup;