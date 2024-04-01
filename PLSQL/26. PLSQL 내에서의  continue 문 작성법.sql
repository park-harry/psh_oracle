continue문 
=> 루프문에서 사용하는 옵션이다.
=> 루프문으로 특정 실행문을 반복할 때 어느 조건에 해당하는 부분을 실행하지 않게 할 때 유용하다.
  - 다 반복하지 않아도 되고 이 부분은 그냥 실행 하지 말고 다른 거 반복해라 !
  - 무시하고 다른 거 반복해라.

- continue 문법:
begin
		for   카운터   in   범위  loop
		  if  조건 then
		         continue ; -- 조건에 부합하면 무시하고 실행문을 실행하라. 
		    end  if;
		        실행문;
		end  loop;
end;
/

문제 1-1. for  loop 문을 이용해서 숫자 1번부터 10번까지 출력하시오 !
set serveroutput on 
begin
		for   i   in   1 .. 10   loop
				dbms_output.put_line(i);
		end  loop;
end;
/

문제 1-2. 위에서 출력되는 결과중에 숫자 4는 출력되지 않게 하시오 !
set serveroutput on 
begin
		for   i   in   1 .. 10   loop
				if  i != 4  then
						dbms_output.put_line(i);
				end  if;
		end  loop;
end;
/

문제 1-3. 위의 결과를 continue 를 이용해서 출력하시오 !
set serveroutput on 
begin
		for   i   in   1 .. 10   loop
				if  i = 4  then
				    continue ;
				end  if;
		    dbms_output.put_line(i);		
		end  loop;
end;
/

문제 2. 1 ~ 10까지의 숫자중에서 짝수만 출력할때 continue 문을 이용해서 수행하시오!
set serveroutput on 
begin 
    for i in 1..10 loop
        if mod(i,2)=1 then 
            continue;
        end if;
        dbms_output.put_line(i);
    end loop;
end;
/

문제 3. 1 ~ 50까지의 숫자 중에서  7의 배수만 출력하시오!
set serveroutput on 
begin 
    for i in 1..50 loop
        if mod(i,7) != 0 then 
            continue;
        end if;
        dbms_output.put_line(i);
    end loop;
end;
/