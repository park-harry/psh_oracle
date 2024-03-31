set serverouput on 
DECLARE
v_outer  VARCHAR2(20) := '글로벌 변수';

BEGIN
		DECLARE
		v_inner  VARCHAR2(20) := '내부 변수';
		BEGIN
		dbms_output.put_line(v_inner);
		dbms_output.put_line(v_outer);
		END;
 dbms_output.put_line(v_outer);
END;
/

문제 1. 위의 예제에서 v_inner 내부변수가 내부블럭에서만 사용될 수 있는데 외부에서도  사용될 수 
있는지 확인해보시오 !
set serverouput on 
DECLARE
v_outer  VARCHAR2(20) := '글로벌 변수';

BEGIN
		DECLARE
		v_inner  VARCHAR2(20) := '내부 변수';
		BEGIN
		dbms_output.put_line(v_inner);
		dbms_output.put_line(v_outer);
		END;
dbms_output.put_line(v_inner);
dbms_output.put_line(v_outer);
END;
/

=> 내부 변수는 내부 블럭에서만 사용 가능하므로 외부에서는 사용할 수 없다. 