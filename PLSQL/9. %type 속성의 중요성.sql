set  serveroutput  on
accept   p_empno  prompt  '�����ȣ�� �Է��ϼ��� ~'
declare
		v_sal     emp.sal%type ;
begin
		select   sal   into   v_sal
		from   emp
		where  empno = &p_empno;
		
		dbms_output.put_line('�ش� ����� ������ ' || v_sal );
end;
/

=> emp.sal % type �� emp table�� sql�� data type�� �״�� �����ڴ�.
=> ������ ������ ������ ������ �� emp.sal%type �̶�� �ϰ� �Ǹ� ���� ū ������ emp ���̺��� 
	������ ������ ������ ũ�Ⱑ ������ �Ǿ��� �� pl/sql �ڵ带 ���� ���������� �ʾƵ� �ȴ�.
	
���� 1. 
���࿡ �Ʒ��� ���� �����ڰ� PL/SQL �ڵ��� �ߴٸ�? 
set  serveroutput  on
	accept   p_empno  prompt  '�����ȣ�� �Է��ϼ��� ~'
declare
		v_sal     number(10) ;
begin
		select   sal   into   v_sal
		from   emp
		where  empno = &p_empno;

dbms_output.put_line('�ش� ����� ������ ' || v_sal );
end;
/

�׷��� ����� dba �� �Ʒ��� ���� emp ���̺��� sal�� �����ߴ�.
alter   table   emp
modify    sal   number(15);

=> �̷��� ũ�⸦ �ø���  db�� sal�� ���õ� PL/SQL ���α׷��� ������ ������ ������number(10)����
	number(15) �� ��������� �Ѵ�. �׷��� ������ ���α׷� �ڵ带 �� ���� ����� �ϴ� ���ŷο���
	�����. �׷��� �ƿ� ó������ PL/SQL �ڵ��� �� ������ ���� �ڵ� �ؾ� �Ѵ�.
	
set  serveroutput  on
	accept   p_empno  prompt  '�����ȣ�� �Է��ϼ��� ~'
declare
	v_sal     emp.sal%type;
begin
	select   sal   into   v_sal
	from   emp
	where  empno = &p_empno;
	
	dbms_output.put_line('�ش� ����� ������ ' || v_sal );
end;
/

���� �ڵ带 �����ؼ� �����ȣ�� ������ϰ� �����ȣ�� �Է��ϸ� �̹����� ���ް� ������ ���� 
��µǰ��Ͻÿ�
�������:
	�����ȣ�� �Է��ϼ��� ~    7788                
	�ش����� ������ 3000
	�ش����� ������  ANALYST

set  serveroutput  on
	accept   p_empno  prompt  '�����ȣ�� �Է��ϼ��� ~'
declare
	v_sal     emp.sal%type;
	v_job 	  emp.job%type;
begin
	select   sal,job   into   v_sal, v_job
	from   emp
	where  empno = &p_empno;

dbms_output.put_line('�ش� ����� ������ ' || v_sal );
dbms_output.put_line('�ش� ����� ������ ' || v_job );
end;
/

���� 2. ������ ���� �����ȣ�� ����� �ϰ� �����ȣ�� �Է��ϸ� �ش� ����� �̸��� ������ ������ 
���� ��µǰ� �Ͻÿ�. 
	�����ȣ�� �Է��ϼ���: 7788
	SCOTT�� ������ 3000�Դϴ�.
	
set serveroutput on 
accept p_empno prompt '�����ȣ�� �Է��Ͻÿ�. '

declare 
        v_ename emp.ename%type;
        v_sal  emp.sal%type;
begin
        select ename, sal into v_ename,v_sal
        from emp 
        where empno = &p_empno;
        
        dbms_output.put_line(v_ename ||'�� ������ '||v_sal||'�Դϴ�.');
end;
/

���� 3. ������ ���� �̸��� ������ϰ� �̸��� �Է��ϸ� �ش� ����� �̸��� ���ް� ������ 
��µǰ� �Ͻÿ�.
		�̸��� �Է��ϼ���: SCOTT
		SCOTT �� ������ 3000 �̰� ������ ANALYST �Դϴ�.
		
set serveroutput on 
set verify off
accept p_ename prompt '�̸��� �Է��ϼ���~'

declare 
    v_ename emp.ename%type;
    v_sal emp.sal%type;
    v_job emp.job%type;

begin 
    select ename, sal, job into v_ename, v_sal,v_job
    from emp 
    where ename = '&p_ename';

    dbms_output.put_line(v_ename||'�� ������ '||v_sal||' �̰� ������ '||v_job||'�Դϴ�.');
end;
/