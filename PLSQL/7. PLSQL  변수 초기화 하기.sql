예제 1. 변수를 선언하고 실행절에서 변수에 값을 할당하는 연습 코드
set serveroutput on

declare
	v_num   number(10);

begin
	dbms_output.put_line('my number is: '|| v_num);
	v_num := 7 ;
	dbms_output.put_line('my number is: '|| v_num);
end;
/

예제 2. 선언절에서 숫자 8을 할당했는데 실행절에서 다른 숫자로 변경되는 코드
set serveroutput on

declare
	v_num   number(10) := 8;

begin
	v_num := 9;
	dbms_output.put_line('my number is: '|| v_num);

end;
/