- ���ν��� ����
create  [ or replace ] procedure [ ���ν��� �̸� ]
( �Է� �Ű� ����   ������ Ÿ�� )
is | as
	[ ����� ]
begin
	[ ����� ]
	exception
	[ ���� ó���� ]
end [ ���ν��� �̸� ];
/

- �͸� PL/SQL �� �� (�̸��� ���� PL/SQL) 

set serveroutput on 
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

- ���ν��� �϶�

create  or replace  procedure  pro1
( p_deptno    emp.deptno%type)
is
    v_deptno     emp.deptno%type :=  p_deptno;
    v_sumsal      number(10,2) ;

begin
    select   sum(sal)   into   v_sumsal
    from   emp
    where   deptno =  v_deptno ;
    
    dbms_output.put_line ( '��Ż������ : '  ||  v_sumsal  );
end pro1;
/
exec pro1(10);


���� 1. ������ ������ PROCEDURE ����� SQL�� ��ȸ�Ͻÿ�. 
select * 
from dba_objects 
where object_type='PROCEDURE' and owner='C##SCOTT';

select object_name, status
from dba_objects 
where object_type='PROCEDURE' and owner='C##SCOTT';

=> inavlid �Ѱ� ������ �ȵȴ�. 

alter procedure cursor_job compile; => invalid �Ѱ��� valid �ϰ� ����� �ڵ� 

alter table emp 
add grade number(10);


=> column �߰� ������ �Ͼ�� column ���� ���̺� procedure���� ���� invalid ���°� �ȴ�. 
	 �׷��� dba�� ���� valid �� �� �ְ� ����� �Ѵ�. 
	 
�ʱ� dba: ���� 6�� ���

�߱� dba
select 'alter procedure '|| object_name||' compile;'
from dba_objects
where owner = 'C##SCOTT' and object_type='PROCEDURE' and status = 'INVALID';

��� dba: �ڵ�ȭ ��Ų�� 