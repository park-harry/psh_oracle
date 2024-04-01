- �Է� �Ķ���Ͱ� �ִ� ���ν��� ����
create  [ or replace ] procedure [ ���ν��� �̸� ]
( �Է� �Ű� ����   ������ Ÿ�� )
is | as
		[ ����� ]
begin
		[ ����� ]
		exception
		[ ���� ó���� ]
end [ ���ν��� �̸� ];


- ���ν��� ���� ����
1. demo.sql �� �����ؼ� emp �� dept ���̺��� �ʱ�ȭ ��Ų��
���ν����� �ƴ� �͸� PL/SQL �ڵ�

set serveroutput on
set verify off
accept   p_deptno   prompt   '�μ���ȣ�� �Է��ϼ��� ~ '
declare
    v_deptno     emp.deptno%type :=  &p_deptno;
    v_sumsal      number(10,2) ;

begin
    select   sum(sal)   into   v_sumsal
    from   emp
    where   deptno =  v_deptno ;
    
    dbms_output.put_line ( '��Ż������ : '  ||  v_sumsal  );
end;
/

���ν����� ����������� �ڵ�
create or replace procedure  pro1
( p_deptno   emp.deptno%type )
is
    v_deptno     emp.deptno%type :=  p_deptno;
    v_sumsal      number(10,2) ;
begin
    select   sum(sal)   into   v_sumsal
    from   emp
    where   deptno =  v_deptno ;
    
    dbms_output.put_line ( '��Ż������ : '  ||  v_sumsal  );
end;
/

���ν��� �����ϴ� ���
set serveroutput on
exec pro1(10);


�ǽ� ȯ�� ���� 
drop table high_sal;
drop table normal_sal;

create  table  high_sal
( deptno    number(10),
sumsal    number(10,2) );

create  table  normal_sal
( deptno   number(10),
sumsal   number(10,2) );


���� 1. �μ���ȣ�� �Է��ϰ��ϰ� �μ���ȣ�� ��Ż������ 10000 �̻��̸� high_salary ���̺� 
�μ���ȣ�� ��Ż������ �Էµǰ��ϰ�10000 ���� ������ normal_salary ���̺� �Էµǰ��ϴ� �Ʒ���
�͸� PL/SQL �� ���ν����� �����Ͻÿ� 
set serveroutput on 
accept p_deptno prompt '�μ���ȣ�� �Է��Ͻÿ�.'
declare 
    v_deptno    emp.deptno%type:= p_deptno;
    v_sumsal    number(10,2);
begin 
    select sum(sal) into v_sumsal
    from emp 
    where deptno = v_deptno;
    
    if v_sumsal >= 10000 then 
        insert into high_sal 
        values(v_deptno, v_sumsal);
    else
        insert into normal_sal
        values(v_deptno, v_sumsal);
    end if;
    commit;
end;
/

- ��: 
create or replace procedure pro1
(p_deptno emp.deptno%type)
is
    v_deptno    emp.deptno%type:= p_deptno;
    v_sumsal    number(10,2);
begin 
    select sum(sal) into v_sumsal
    from emp 
    where deptno = v_deptno;
    
    if v_sumsal >= 10000 then 
        insert into high_sal 
        values(v_deptno, v_sumsal);
    else
        insert into normal_sal
        values(v_deptno, v_sumsal);
    end if;
    commit;
end;
/

exec pro1(10);
exec pro1(20);
select * from high_sal;
select * from normal_sal;