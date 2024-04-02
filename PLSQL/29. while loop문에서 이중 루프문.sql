반복문 자체를 반복 시키고 싶을 때 이중 반복문을 사용한다.
- while loop 문법
begin
		while  조건  loop
				while  조건  loop
				
				실행문 ;
				end  loop;
		end  loop;
end;
/

문제 1. 구구단 2단을 while loop 문으로 구현하시오 !
declare
		v_count     number(10) := 1;
begin
		while   v_count < 10  loop
				dbms_output.put_line( '2 x '  || v_count ||  ' = ' || 2 * v_count );
				v_count  :=  v_count +  1 ;
		end  loop;
end;
/

문제 2. 구구단 전체를 while loop문으로 출력하시오 !
set serveroutput on
declare
    v_dan    number(10) := 2;
    v_count   number(10) := 1 ;
begin
    while v_dan < 10 loop
           while v_count < 10 loop
                dbms_output.put_line(v_dan||'x'||v_count||'='||v_dan*v_count);
                v_count:= v_count +1;
           end loop;
       v_count := 1;
       v_dan := v_dan +1;
    end loop; 
end;
/

문제 3. 구구단의 짝수단만 출력되게 하시오 !
set serveroutput on
declare
    v_dan    number(10) := 2;
    v_count   number(10) := 1 ;
begin
    while v_dan < 10 loop
        if mod(v_dan,2)=0 then 
           while v_count < 10 loop
                dbms_output.put_line(v_dan||'x'||v_count||'='||v_dan*v_count);
                v_count:= v_count +1;
           end loop;
        end if;
       v_count := 1;
       v_dan := v_dan +1;
    end loop; 
end;
/