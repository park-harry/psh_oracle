- if ~ else  문법 설명
begin
	if   조건  then
		실행문1;
	else
		실행문2;
	end if;	
end;
/

예제 1. 
set  serveroutput  on
declare
		v_a     number(10) :=  1;
		v_b     number(10) :=  2;
		
begin
		if   v_a > v_b then
		dbms_output.put_line( to_char(v_a) || '은 ' ||  to_char(v_b)  || ' 보다 큽니다. '  );
		else
		dbms_output.put_line( to_char(v_a) || '은 ' ||  to_char(v_b)  || ' 보다 작습니다. ' );
		end  if;
end;
/

문제 1. 두개의 숫자를 각각 물어보게하고 두개의 숫자를 입력하면 두개의 숫자의 크기를 비교해서 다음과 같이
결과가 출력되게하시오!

	첫번째 숫자를 입력하세요 ~  7
	두번째 숫자를 입력하세요 ~  6
	
	7 은  6 보다 큽니다.
	
	첫번째 숫자를 입력하세요 ~  6
	두번째 숫자를 입력하세요 ~  7
	
	6 은 7 보다 작습니다. 

set  serveroutput  on
set verify off
accept  p_a   prompt '첫번째 숫자를 입력하세요 '
accept  p_b   prompt '두번째 숫자를 입력하세요 '

declare
		v_a     number(10) :=  &p_a;
		v_b     number(10) :=  &p_b;

begin
		if v_a > v_b then 
				dbms_output.put_line( v_a ||'은 '||v_b||'보다 큽니다.'  );
		else
				dbms_output.put_line( v_a ||'은 '||v_b||'보다 작습니다.'  );
		end if;
end;
/