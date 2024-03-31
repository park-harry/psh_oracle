식별자 : 변수명
  - 예: v_ename, v_sal
    
- 구분자 : 연산자, 세미콜론
  - 예: + , - , ;
    
- 리터럴 : 문자 데이터 값, 숫자 데이터 값 .
  - 예: 'scott' , 7788
    
- 주석 : 특정 코드 부분이 실행되지 않게 하고 싶을 때 사용 .
  - 한줄 주석의 예 :
   v_ename varchar2(10) ; -- 이름을 담을 변수를 선언합니다.
   
  - 여러줄 주석의 예 : 
  /* 프로그램 이름:
      프로그램 설명:
      작성자 :
      작성날짜 :
      마지막 수정 날짜:*/
      
예제 1. 다음의 코드에서 식별자와 구분자와 리터럴이 뭔지 각각 설명하시오. 
set  serveroutput  on
accept   p_empno  prompt  '사원번호를 입력하세요 ~'
declare
v_sal     number(10)  := 0 ;
begin
select   sal   into  v_sal
from   emp
where  empno = &p_empno;

dbms_output.put_line('해당 사원의 월급은 ' || v_sal );
end;
/

=> 식별자: p_empno, v_sal
=> 구분자: ; 
=> 리터럴: 0 