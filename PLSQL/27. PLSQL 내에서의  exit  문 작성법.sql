exit 문
=> 루프문에서 사용하는 옵션이다. 반복문을 반복되는 중간에 종료할 때 사용한다.

- exit  문법:
begin
		for   카운터   in   범위  loop
		  if  조건 then
		      exit  ;
		   end  if;
		      실행문;
		 end  loop;
end;
/

문제 1. for  loop 문을 이용해서 숫자 1번부터 10번까지 출력하시오 !
begin
		for   i   in   1 .. 10   loop
				dbms_output.put_line(  i  );
		end  loop;
end;
/

문제 2. 1부터 10까지 출력되는 반복문을 수행하시오.숫자 3까지 출력하고 숫자 4 에서는 반복문을 종료 
시키시오.
begin
		for   i   in   1 .. 10   loop
				if  i = 4  then
						exit  ;
				end  if;
		dbms_output.put_line(i);
		end  loop;
end;
/

문제 3. 아래의 구구단 2단을 출력하는 PL/SQL문에서 2 x 7 = 14 까지만 출력되고 2 x 8 = 16 부터는 
출력되지 않게 exit 문을 추가하시오!
set serveroutout on 
begin 
    for i in 1..9 loop
        if i = 8 then 
            exit;
        end if;
        dbms_output.put_line('2 x ' || i || ' = ' || 2 * i );
    end loop;
end;
/