1. 변수 이름은 반드시 문자로 시작해야 한다.
2. 변수 이름은 문자나 숫자를 포함할 수 있다.
3. 특수문자는 #, $, _ 만 쓸 수 있다.
4. 30자 이내로 작성해야 한다.
5. 오라클 예약어를 쓸 수 없다.

문제 1. 오라클 예약어를 변수명으로 사용하면 오류가 나는지 테스트 하세요
set  serveroutput  on
accept   p_num1   prompt   '첫번째 숫자를 입력하세요 ~'
accept   p_num2  prompt    '두번째 숫자를 입력하세요 ~'

declare
		select       number(10);
begin
		select :=  &p_num1 +  &p_num2 ;
		dbms_output.put_line('총합은 :  '  ||  select );
end;
/
=> 오류 난다. 오라클 예약어를 변수명으로 쓸 수 없다. 

문제 2. 아래의 코드에서 변수명을 select 대신에 from 이라고 하면 에러가 나는지 확인하시오. 
set  serveroutput  on
accept   p_num1   prompt   '첫번째 숫자를 입력하세요 ~'

accept   p_num2  prompt    '두번째 숫자를 입력하세요 ~'

declare
		from       number(10);
begin
		from :=  &p_num1 +  &p_num2 ;
		dbms_output.put_line('총합은 :  '  ||  from );
end;
/
=> 오류 난다. 오라클 예약어를 변수명으로 쓸 수 없다. 