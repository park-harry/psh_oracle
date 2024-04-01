- for loop 이중 루프문 문법:
begin
		for   카운터 인덱스  in   반복할 범위  loop
				for   카운터 인덱스   in  반복할 범위  loop
				실행문;
				end  loop;
		end  loop;
end;
/

문제 1. for  loop문으로 구구단 2단을 출력하시오 !
begin
	for  i   in   1 .. 9  loop
			dbms_output.put_line( '2 x  ' ||  i  || ' = ' ||  2* i );
	end  loop;
end;
/

문제 2. for  loop문으로 구구단 2단과 3단을 출력하시오!
set serveroutput on 
begin 
    for i in 2..3 loop
        for j in 1..9 loop 
            dbms_output.put_line(i||'x'||j||'='||i*j);
        end loop;
    end loop;
end;
/

문제 3. 구구단 2단부터 9단까지 전체를 다 출력하시오 !
set serveroutput on 
begin 
    for i in 2..9 loop
        for j in 1..9 loop 
            dbms_output.put_line(i||'x'||j||'='||i*j);
        end loop;
    end loop;
end;
/