-  if ~ elsif  ~ else ���� ����
begin
		if   ����1  then
				���๮1;
		elsif ����2 then
				���๮2;
		else
				���๮3;
		end if;	
end;
/

if ~ elsif  ~ else �� �ǽ� ����.
set  serveroutput  on
set verify off
accept  p_a   prompt 'ù��° ���ڸ� �Է��ϼ��� '
accept  p_b   prompt '�ι�° ���ڸ� �Է��ϼ��� '

declare
		v_a     number :=  &p_a;
		v_b     number :=  &p_b;
		
begin
		if   v_a > v_b then
				dbms_output.put_line( to_char(v_a) || '�� ' ||  to_char(v_b)  || ' ���� Ů�ϴ�. '  );
		elsif  v_a < v_b then
				dbms_output.put_line( to_char(v_a) || '�� ' ||  to_char(v_b)  || ' ���� �۽��ϴ�. ' );
		else
				dbms_output.put_line( to_char(v_a) || '�� ' ||  to_char(v_b)  || ' �� �����ϴ�. ' );
		end  if;
end;
/

���� 1. ������ ���� �̸��� ����� �ϰ� �̸��� �Է��ϸ� �ش� ����� ���޿� ���� ����� ��µǰ��Ͻÿ�.

	������ 3000 �̻��̸� A ���
	������ 2000 �̻� ~ 3000 ���� ������ B ���
	������ 1000 �̻� ~ 2000 ���� ������ C ���
	������ ������  D ���

set serveroutput on 
set verify off 
accept p_ename prompt '�̸��� �Է��ϼ���: '

declare 
		v_ename emp.ename%type := upper('&p_ename');
		v_sal emp.sal%type;
begin 
		select sal into v_sal 
		from emp 
		where ename = v_ename;
		
		if v_sal >= 3000 then 
			dbms_output.put_line ('A ���');
		elsif v_sal >= 2000  then 
			dbms_output.put_line ('B ���');
		elsif v_sal >= 1000  then 
			dbms_output.put_line ('C ���');
		else 
			dbms_output.put_line ('D ���');
		end if;
end;
/

������ ���� �ش� �л��� ���������� �������������� ��µǰ� �ϴµ� ������ ���������ε� before_job
���� it ����� �ִ� �����ڷ� ��µǰ� �Ͻÿ�. �����ڷ� ����ϴ� �л����� major�� ��ǻ��, ������� 
���� �� ���Ե� �л����̴�. 

create or replace function func10
(p_ename emp18.ename%type) 
return varchar2 
as 
    v_major emp18.major%type;
    v_before_job emp18.before_job%type;
    v_msg varchar2(20);
begin
    select major,before_job into v_major,v_before_job
    from (select ename, before_job, major
            from emp18)
    where ename = p_ename ;
    
    if (v_before_job like '%���α׷���%' or v_before_job like '%��%' or
        v_before_job like '%Ŭ����%')then 
        v_msg := '������';
    elsif (v_major like '%��ǻ��%' or v_major like '%�������%' or 
        v_major like '%�ΰ�����%' ) then 
        v_msg := '������';
    else 
        v_msg :='��������';
    end if;
    
    return v_msg;
end;
/
select ename, func10(ename)
from emp18;