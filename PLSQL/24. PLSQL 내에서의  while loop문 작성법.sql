- while loop문 문법
begin
		while  조건  loop
			실행문;
			반복문의 조건의 False 로 만들 코드
		end  loop;
end;
/

=> while loop 문은 반복할 조건을 미리 알고 있는 경우에 작성하기 유용한 반복문이다.  
	 while 과 loop 사이에 조건이 True 인 동안에만 반복문이 실행된다.

문제 1. while  loop 문을 이용해서 아래의 문장을 7번 반복 출력하세요.
PL/SQL 을 사용하여 DB업무를 자동화 합니다.

	구현결과:
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.
	PL/SQL 을 사용하여 DB업무를 자동화 합니다.*/

declare
		v_cnt       number := 1 ;
begin
		while  v_cnt < 8  loop
				dbms_output.put_line( 'PL/SQL 을 사용하여 DB업무를 자동화 합니다.' ) ;
				v_cnt :=   v_cnt +  1 ;
		end  loop;
end;
/	 

문제 2. 1~10 까지의 숫자중에 짝수만 출력하시오.
set serveroutput on 
declare 
    v_cnt  number := 1;
begin 
    while v_cnt <= 10 loop
        if mod(v_cnt,2) =0 then 
            dbms_output.put_line(v_cnt);
        end if;
        v_cnt := v_cnt +1;
    end loop;
end;
/

문제 3. while loop 을 이용하여 구구단 8단에서 홀수 부분만 출력하시오 !
set serveroutput on 
declare 
    v_cnt number(10) := 1;
begin 
        while v_cnt <=9 loop
            if mod(v_cnt,2) =1 then 
                dbms_output.put_line('8 x '|| v_cnt||' = '|| 8*v_cnt);
            end if;
            v_cnt := v_cnt +1;
        
        end loop;
end;
/