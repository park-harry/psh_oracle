디버깅(debuging): 코드에서 버그(에러의 원인)를 찾아 내는 것.

PL/SQL 코드를 디버깅 하기
=> sqldeveloper 를 실행하고 아래의 설정을 한다.

도구 -> 환경설정 ->디버거-> DBMS_DEBUG 사용 체크

=> 아래의 pro77 프로시져를 생성한다. 
create   or  replace   procedure   pro77
is
    v_dan        number := 2 ;
    v_count     number(10) := 1;
begin
    while   v_dan  <= 9  loop
        while   v_count <= 9  loop
            dbms_output.put_line(v_dan||'x'||v_count||'='||v_dan *v_count);
            v_count  :=  v_count +  1 ;
        end  loop;
    v_dan := v_dan + 1 ;
    v_count :=  1;
    end  loop;
end;
/

set serveroutput on 
execute pro77;

=> sqldeveloper 에서 프로시져 pro77을 클릭하면 소스코드가 보이는데 여기서 중단점을 찍어야 한다. 
	 중단점을 찍는 이유는 중단점에서 일시멈춤을 하기 위해서다.
=> pro77 을 클릭하고 오른쪽 마우스를 눌러서 ‘디버그를 위한 컴파일’을 한다.
=> 무당벌레 아이콘을 누른다.
=> 오른쪽 아래에 탭에 스마트 데이터 탭을 클릭하고 F7 을 누르면서 디버깅을 진행한다.


문제 1. 구구단 2단을 출력하는 아래의 코드를 디버깅 하시오!
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

- 답: 
create or replace procedure pro78
as
    v_count   number(10) := 1 ;
begin
    loop
        dbms_output.put_line( '2 x  ' || v_count || ' = ' || 2 * v_count );
        v_count  :=  v_count +  1 ;
        exit  when  v_count > 9;
    end  loop;
end;
/

set serveroutput on 
execute pro78;