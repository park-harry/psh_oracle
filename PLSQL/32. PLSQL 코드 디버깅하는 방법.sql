�����(debuging): �ڵ忡�� ����(������ ����)�� ã�� ���� ��.

PL/SQL �ڵ带 ����� �ϱ�
=> sqldeveloper �� �����ϰ� �Ʒ��� ������ �Ѵ�.

���� -> ȯ�漳�� ->�����-> DBMS_DEBUG ��� üũ

=> �Ʒ��� pro77 ���ν����� �����Ѵ�. 
create   or  replace   procedure   pro77
is
    v_dan        number := 2 ;
    v_count     number(10) := 1;
begin
    while   v_dan  <= 9  loop
        while   v_count <= 9  loop
            dbms_output.put_line(v_dan||'x'||v_count||'='||v_dan *v_count);
            v_count  :=  v_count +  1 ;
        end  loop;
    v_dan := v_dan + 1 ;
    v_count :=  1;
    end  loop;
end;
/

set serveroutput on 
execute pro77;

=> sqldeveloper ���� ���ν��� pro77�� Ŭ���ϸ� �ҽ��ڵ尡 ���̴µ� ���⼭ �ߴ����� ���� �Ѵ�. 
	 �ߴ����� ��� ������ �ߴ������� �Ͻø����� �ϱ� ���ؼ���.
=> pro77 �� Ŭ���ϰ� ������ ���콺�� ������ ������׸� ���� �����ϡ��� �Ѵ�.
=> ������� �������� ������.
=> ������ �Ʒ��� �ǿ� ����Ʈ ������ ���� Ŭ���ϰ� F7 �� �����鼭 ������� �����Ѵ�.


���� 1. ������ 2���� ����ϴ� �Ʒ��� �ڵ带 ����� �Ͻÿ�!
set serveroutput on
declare
		v_count   number(10) := 1 ;
begin
		loop
				dbms_output.put_line( '2 x  ' || v_count || ' = ' || 2 * v_count );
				v_count  :=  v_count +  1 ;
				exit  when  v_count > 9;
		end  loop;
end;
/

- ��: 
create or replace procedure pro78
as
    v_count   number(10) := 1 ;
begin
    loop
        dbms_output.put_line( '2 x  ' || v_count || ' = ' || 2 * v_count );
        v_count  :=  v_count +  1 ;
        exit  when  v_count > 9;
    end  loop;
end;
/

set serveroutput on 
execute pro78;