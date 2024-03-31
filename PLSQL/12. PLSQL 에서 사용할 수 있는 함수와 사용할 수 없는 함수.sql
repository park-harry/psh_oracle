PL/SQL 에서 사용할 수 있는 함수 
- 단일행 함수 대부분 : 문자, 숫자, 날짜, 변환, 일반
    
PL/SQL 에서 사용할 수 없는 함수 
- 단일행 함수 중에는  decode 함수
- 그룹함수 : max, min, avg, sum, count
    
    
예제 1. 문자를 입력하게 하고 문자의 철자의 갯수를 출력하는 PL/SQL문
set  serveroutput  on
		accept   p_str  prompt   '문자열을 입력하시오 ~  '

declare
		v_str       varchar2(100)  :=  '&p_str' ;
		v_result    number(20) ;

begin
		v_result := length(v_str);
		dbms_output.put_line( v_result ) ;
end;
/

문제 1. 위의 코드를 수정해서 이름을 물어보게하고 이름을 입력하면 이름의 성씨만 출력되게하는 PL/SQL
코드를 작성하시오.
	이름을 입력하세요 ~   홍길동
	홍

set  serveroutput  on
		accept    p_str   prompt   '이름을 입력하시오 ~  '

declare
		v_str       varchar2(100)  :=  '&p_str' ;
		v_result    varchar2(20) ;

begin
		v_result := substr(v_str,1,1);
		dbms_output.put_line( v_result ) ;
end;
/

문제 2. 숫자를 물어보게하고 숫자를 입력해서 숫자 1을 입력하면 true 가 출력되게하고 0 을 입력하면 
false 를 출력하게 하시오. decode 함수를 이용해서 작성하시오.
	숫자를 입력하세요 ~ 1
	true
	숫자를 입력하세요 ~ 0
	false*/

set serveroutput on
		accept p_num prompt '숫자를 입력하시오 ~ '

declare
	v_num   number(10) := &p_num;
	v_result  varchar2(10);

begin
		v_result := decode( v_num, 1, 'true', 0, 'false');
		dbms_output.put_line( v_result );
end;
/
=> pl/sql에서는 decode를 쓸 수 없기 떄문에 error 발생한다. 

문제 3. SQL문장에 decode 를 써서 위의 결과가 실행되게 하시오 !
set serveroutput on
accept p_num prompt '숫자를 입력하시오 ~ '

declare
		v_num   number(10) := &p_num;
		v_result  varchar2(10);

begin
		select decode(v_num,1,'true',0,'false') into v_result
		from dual;
		
		dbms_output.put_line( v_result );

end;
/