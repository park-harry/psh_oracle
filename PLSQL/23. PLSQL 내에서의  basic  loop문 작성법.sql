- basic loop문 문법
declare
		v_counter   number : = 1 ;

begin
		loop
			-- 반복 시키고 싶은 실행문;
			v_counter := v_counter + 1 ;
			exit when -- 반복문을 종료시킬 조건;
		end  loop;
end;
/

문제 1. basic  loop 문으로 다음의 문장을 7번 반복해서 출력하시오. 
PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	
	구현결과:
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.

set serveroutput on

declare
		v_counter   number(10) := 1 ;
begin
		loop
			dbms_output.put_line( ' PL/SQL 을 사용하여 DB업무를 자동화 합니다.' );
			v_counter  :=  v_counter +  1 ;
			exit   when   v_counter = 8;
		end  loop;
end;
/

-- 위의 코드를 100번 반복해서 출력하시오. 
set serveroutput on

declare
		v_counter   number(10) := 1 ;
begin
		loop
			dbms_output.put_line( ' PL/SQL 을 사용하여 DB업무를 자동화 합니다.' );
			v_counter  :=  v_counter +  1 ;
			exit   when   v_counter = 101;
		end  loop;
end;
/

문제 2. basic loop 문 문제. 구구단 2단의 basic loop문으로 수행 하시오.
	구현결과:
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