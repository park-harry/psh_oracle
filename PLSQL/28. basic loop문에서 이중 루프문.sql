반복문 자체를 반복 시키고 싶을 때 이중 반복문을 사용합니다.

- 문법:
begin
		loop
				loop
						실행문;
						exit  when 안쪽 반복문을 종료시킬 조건;
				end  loop;
				exit  when 바깥쪽 반복문을 종료시킬 조건;
		end  loop;
end;
/

문제 1. basic loop문으로 숫자 1부터 9까지 출력하시오!
set serveroutput on 
declare 
		v_count number(10) := 1;
begin 
		loop 
				dbms_output.put_line(v_count);
				v_count := v_count +1;
				exit when v_count >9;
		end loop;
end;
/

문제 2. 구구단 2단을 출력하는 기본 basic loop문을 수행하시오 !
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

문제 3. basic loop 문으로 구구단 전체를 출력하시오! (이중 루프문으로 작성)
set serveroutput on
declare
    v_dan    number(10) := 2;
    v_count   number(10) := 1 ;
begin
    loop
        loop
            dbms_output.put_line(v_dan||'x'||v_count||'='||v_dan*v_count);
            v_count := v_count +1;
            exit when v_count > 9;
        end loop;
       v_dan := v_dan +1;
       v_count := 1; -- v_count를 다시 1로 변경하는 코드 
       exit when v_dan >9;
    end  loop;
end;
/

문제 4. 구구단 전체를 출력하는 코드에 코드를 추가하여 구구단 짝수단만 출력되게 하시오.
set serveroutput on
declare
    v_dan    number(10) := 2;
    v_count   number(10) := 1 ;
begin
        loop
            if mod(v_dan,2) = 0 then 
                loop
                    dbms_output.put_line(v_dan||'x'||v_count||'='||v_dan*v_count);
                    v_count := v_count +1;
                    exit when v_count > 9;
                end loop;
             end if;
               v_dan := v_dan +1;
               v_count := 1; 
               exit when v_dan >9;
        end  loop;
end;
/