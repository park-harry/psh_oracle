- basic loop�� ����
declare
		v_counter   number : = 1 ;

begin
		loop
			-- �ݺ� ��Ű�� ���� ���๮;
			v_counter := v_counter + 1 ;
			exit when -- �ݺ����� �����ų ����;
		end  loop;
end;
/

���� 1. basic  loop ������ ������ ������ 7�� �ݺ��ؼ� ����Ͻÿ�. 
PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	
	�������:
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.

set serveroutput on

declare
		v_counter   number(10) := 1 ;
begin
		loop
			dbms_output.put_line( ' PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.' );
			v_counter  :=  v_counter +  1 ;
			exit   when   v_counter = 8;
		end  loop;
end;
/

-- ���� �ڵ带 100�� �ݺ��ؼ� ����Ͻÿ�. 
set serveroutput on

declare
		v_counter   number(10) := 1 ;
begin
		loop
			dbms_output.put_line( ' PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.' );
			v_counter  :=  v_counter +  1 ;
			exit   when   v_counter = 101;
		end  loop;
end;
/

���� 2. basic loop �� ����. ������ 2���� basic loop������ ���� �Ͻÿ�.
	�������:
	2 x  1 = 2
	2 x  2 = 4
	2 x  3 = 6
	2 x  4 = 8
	2 x  5 = 10
	2 x  6 = 12
	2 x  7 = 14
	2 x  8 = 16
	2 x  9 = 18

set serveroutput on 
declare 
    v_counter number(10) := 1;
begin 
    loop
        dbms_output.put_line('2 x '|| v_counter|| ' = '|| 2*v_counter);
        v_counter := v_counter +1;
        exit when v_counter = 10;
    end loop;
end;
/