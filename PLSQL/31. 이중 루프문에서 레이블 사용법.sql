이중 루프문에서 레이블을 사용하게 되면 어느 코드까지가 밖의 루프문이고 어느 코드까지가 안쪽 루프문 인지를 명확히 구분할 수 있다.

문제 1. 구구단 전체를 출력하는 basic loop문에서 레이블을 사용하시오
declare
    v_dan      number(10) := 2;
    v_count   number(10) := 1 ;
begin
    <<Outer_loop>>
        loop
            <<Inner_loop>>
                loop
                    dbms_output.put_line( v_dan||'x'|| v_count||'='||v_dan * v_count );
                    v_count  :=  v_count +  1 ;
                    exit  Inner_loop when  v_count > 9;
                end  loop  Inner_loop;
            v_dan := v_dan + 1;  -
            v_count := 1;           
            exit Outer_loop when  v_dan > 9;   -> 밖의 루프문을 종료시키는 코드
        end loop Outer_loop;
end;
/

문제 2. 다음의 이중 for loop문에 레이블을 추가하세요.
begin
    <<outer_loop>>
    for   i  in   2 .. 9  loop
        <<inner_loop>>
        for   j   in  1 .. 9  loop
            dbms_output.put_line( i  || ' x ' ||  j  ||  ' = ' ||  i * j );
        end loop inner_loop;
    end loop outer_loop;
end;
/