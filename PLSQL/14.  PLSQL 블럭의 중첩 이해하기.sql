set serverouput on 
DECLARE
v_outer  VARCHAR2(20) := '�۷ι� ����';

BEGIN
		DECLARE
		v_inner  VARCHAR2(20) := '���� ����';
		BEGIN
		dbms_output.put_line(v_inner);
		dbms_output.put_line(v_outer);
		END;
 dbms_output.put_line(v_outer);
END;
/

���� 1. ���� �������� v_inner ���κ����� ���κ������� ���� �� �ִµ� �ܺο�����  ���� �� 
�ִ��� Ȯ���غ��ÿ� !
set serverouput on 
DECLARE
v_outer  VARCHAR2(20) := '�۷ι� ����';

BEGIN
		DECLARE
		v_inner  VARCHAR2(20) := '���� ����';
		BEGIN
		dbms_output.put_line(v_inner);
		dbms_output.put_line(v_outer);
		END;
dbms_output.put_line(v_inner);
dbms_output.put_line(v_outer);
END;
/

=> ���� ������ ���� �������� ��� �����ϹǷ� �ܺο����� ����� �� ����. 