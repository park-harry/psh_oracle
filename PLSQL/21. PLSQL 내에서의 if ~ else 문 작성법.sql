- if ~ else  ���� ����
begin
	if   ����  then
		���๮1;
	else
		���๮2;
	end if;	
end;
/

���� 1. 
set  serveroutput  on
declare
		v_a     number(10) :=  1;
		v_b     number(10) :=  2;
		
begin
		if   v_a > v_b then
		dbms_output.put_line( to_char(v_a) || '�� ' ||  to_char(v_b)  || ' ���� Ů�ϴ�. '  );
		else
		dbms_output.put_line( to_char(v_a) || '�� ' ||  to_char(v_b)  || ' ���� �۽��ϴ�. ' );
		end  if;
end;
/

���� 1. �ΰ��� ���ڸ� ���� ������ϰ� �ΰ��� ���ڸ� �Է��ϸ� �ΰ��� ������ ũ�⸦ ���ؼ� ������ ����
����� ��µǰ��Ͻÿ�!

	ù��° ���ڸ� �Է��ϼ��� ~  7
	�ι�° ���ڸ� �Է��ϼ��� ~  6
	
	7 ��  6 ���� Ů�ϴ�.
	
	ù��° ���ڸ� �Է��ϼ��� ~  6
	�ι�° ���ڸ� �Է��ϼ��� ~  7
	
	6 �� 7 ���� �۽��ϴ�. 

set  serveroutput  on
set verify off
accept  p_a   prompt 'ù��° ���ڸ� �Է��ϼ��� '
accept  p_b   prompt '�ι�° ���ڸ� �Է��ϼ��� '

declare
		v_a     number(10) :=  &p_a;
		v_b     number(10) :=  &p_b;

begin
		if v_a > v_b then 
				dbms_output.put_line( v_a ||'�� '||v_b||'���� Ů�ϴ�.'  );
		else
				dbms_output.put_line( v_a ||'�� '||v_b||'���� �۽��ϴ�.'  );
		end if;
end;
/