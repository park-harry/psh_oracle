emp -> emp_test2 �� update  �����ϱ�
���� 1. emp ���̺�� �Ȱ��� ������ ���� emp_test2 ���̺��� �����Ͻÿ�.
�׸��� emp ���̺��� �����ȣ�� emp_test2 ���̺� �Է��Ͻÿ�. 
create table emp_test2
as 
select * 
from emp 
where 1 = 2;

insert into emp_test2(empno)
select empno 
from emp;

���� 2. �����ȣ�� �Է¹޾� �ش� �����ȣ�� �����͸� emp ���̺��� �ҷ��ͼ� emp_test2 ���̺� 
�Էµǰ� PL/SQL�� �ۼ��Ͻÿ�.

accept p_empno prompt '�����ȣ�� �Է��ϼ��� !'
declare 
    v_empno emp.empno%type:= &p_empno;
    v_emp   emp%rowtype;
begin 
    select * into v_emp
    from emp 
    where empno = v_empno;
    
    v_emp.sal := 0;
    
    update emp_test2
    set row = v_emp 
    where empno = v_empno;

		commit;
end;
/

���� 3. ���� salgarde ���̺��� ������ ������ salgrade_test ���̺��� �����Ͻÿ�. 
�׸��� grade �÷��� 1~5���� �Է��Ͻÿ�. 

drop  table  salgrade;
create table salgrade
( grade   number(10),
losal   number(10),
hisal   number(10) );

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);
commit;

create table salgrade_test
as 
    select * from salgrade 
    where 1=2;

insert into salgrade_test(grade) 
select grade 
from salgrade;

���� 4. grade �� ������ϰ� grade �� �Է��ϸ� �ش� ����� �����͸�  salgrade ���̺��� �о
salgrade_test ���̺� ���ŵǰ��ϴ� PL/SQL ���α׷��� �ۼ��Ͻÿ�.

accept  p_grade  prompt  '����� �Է��ϼ��� ~ '
declare
    v_grade     salgrade.grade%type :=  &p_grade;
    v_salgrade    salgrade%rowtype ;
begin
    select   *   into   v_salgrade
    from  salgrade
    where   grade = v_grade;
    
    update salgrade_test
    set row = v_salgrade
    where grade = v_grade;

		commit;
end;
/