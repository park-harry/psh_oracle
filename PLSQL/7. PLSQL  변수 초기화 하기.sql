���� 1. ������ �����ϰ� ���������� ������ ���� �Ҵ��ϴ� ���� �ڵ�
set serveroutput on

declare
	v_num   number(10);

begin
	dbms_output.put_line('my number is: '|| v_num);
	v_num := 7 ;
	dbms_output.put_line('my number is: '|| v_num);
end;
/

���� 2. ���������� ���� 8�� �Ҵ��ߴµ� ���������� �ٸ� ���ڷ� ����Ǵ� �ڵ�
set serveroutput on

declare
	v_num   number(10) := 8;

begin
	v_num := 9;
	dbms_output.put_line('my number is: '|| v_num);

end;
/