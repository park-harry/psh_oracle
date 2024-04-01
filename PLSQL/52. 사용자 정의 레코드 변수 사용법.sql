PL/SQL ������ ���� 3����
1. ��Į�� ����
2. ���� ����
3. ���ε� ����

����.  
select ename, sal, deptno 
from emp 
where deptno = &deptno; -> ġȯ���� 

select ename, sal, deptno 
from emp 
where deptno = : deptno; -> ���ε� ���� 


���� ������ ���� 2����
1. record
=> ����� ���� ���ڵ� ����
=> %rowtype
2. collection
=> ���� �迭
   => Ű�� ������ ������ collection
=> varray:
   => ���� �迭ó�� Ű�� ������ �̷���� �÷��� ������. varray �� ��Ƴ� �������� ���� ������
	    ó������ �����ؾ� �Ѵ�. �׸��� ������ �ݵ�� �ʱ�ȭ �ؾ� �Ѵ�.
=> ��ø ���̺�
   => �ϳ� �̻��� ���� ������ �� �ִ� �÷��� ������ ���� �� �ϳ���.
   => ���� �迭�� varray���� �ٸ� ���� ��ø ���̺��� ���̺� ��ü�� �����͸� ���� �� �ִ� �������
	    ���̴�.
   
   
����� ���� ���ڵ� ���� ����
�����ȣ�� �Է��ؼ� ���ν����� �����ϸ� �ش� ����� �̸��� ���ް� ������ ��µǰ� �Ͻÿ�.
create or replace  procedure  pro1
(p_empno  emp.empno%type )
is
    type   t_rec   is   record
    (ename   emp.ename%type,
    sal       emp.sal%type,
    job       emp.job%type  );
v_myrec     t_rec ;
begin  
    select   ename, sal, job  into   v_myrec
    from  emp
    where  empno =  p_empno;
    
    dbms_output.put_line ( v_myrec.ename ||chr(9)||
                            v_myrec.sal ||chr(9) ||
                            v_myrec.job) ;
end;
/

set serveroutput on
exec pro1(7788);

���� 1. �̸��� �Է��ؼ� ���ν����� �����ϸ� �ش� ����� �̸��� ���ް� ������ ��µǰ��ϴ� 
���ν����� �����ϼ���.
create or replace  procedure  pro_ename
(p_ename  emp.ename%type )
is
    type   t_rec   is   record
    (ename   emp.ename%type,
    sal       emp.sal%type,
    job       emp.job%type  );
v_myrec     t_rec ;
begin  
    select   ename, sal, job  into   v_myrec
    from  emp
    where  ename =  p_ename;
    
    dbms_output.put_line ( v_myrec.ename ||chr(9)||
                            v_myrec.sal ||chr(9) ||
                            v_myrec.job) ;
end;
/

set serveroutput on
exec pro_ename('SCOTT');