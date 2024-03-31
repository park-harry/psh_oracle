SQL 에서의 암시적 형 변환 1
select   ename, sal
from  emp
where  sal = '3000';

=> 암시적으로 '3000'을 숫자형으로 변환한다. 

SQL 에서의 암시적 형 변환 2 
select   ename, hiredate
from  emp
where  hiredate =  '82-12-22';

=> 암시적으로 문자형을 날짜형으로 변환한다. 

select ename, hiredate
from  emp
where  hiredate = to_date('22-12-82','DD-MM-RR');

※ 현재 내가 접속한 세션의 날짜형식, 언어, 화폐 단위 확인하기
select * from nls_session_parameters;

실습 1. 암시적 형 변환이 PL/SQL 에서 일어나는 경우를 테스트 하시오.
set  serveroutput  on
declare
	v_sal      emp.sal%type  := 0  ;
	v_hiredate    emp.hiredate%type :=  '82/12/22' ;

begin
	dbms_output.put_line( v_sal );
	dbms_output.put_line( v_hiredate );
end;
/

=> 암시적 형 변환이 일어나서 에러 없이 잘 수행된다. 

실습 2. 암시적 형변환이 실패할 수 있도록 날짜 형식을 서양권 날짜 형식으로 변경해서 수행하시오.
set  serveroutput  on
declare
	v_sal      emp.sal%type  := 0  ;
	v_hiredate    emp.hiredate%type :=  '22/12/82' ;

begin
	dbms_output.put_line( v_sal );
	dbms_output.put_line( v_hiredate );
end;
/

문제 1. 명시적 형변환 함수 to_date 를 사용하여  '22/12/82' 를 그대로 사용하더라도 에러가 나지 않도록
코드를  수정하시오!

set  serveroutput  on
declare
v_sal      emp.sal%type  := 0  ;
v_hiredate    emp.hiredate%type := to_date('22/12/82','DD/MM/RRRR')  ;

begin
dbms_output.put_line( v_sal );
dbms_output.put_line( v_hiredate );
end;
/