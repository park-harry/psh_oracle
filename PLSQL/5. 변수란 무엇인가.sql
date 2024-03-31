데이터를 저장하는 메모리의 임시 저장 영역을 변수라고 한다.

스칼라(scalar) 변수
1. 문자형 변수 :  문자 데이터를 담는 변수
      예:   v_ename      varchar2(20)
      
 2. 숫자형 변수 :  숫자 데이터를 담는 변수
    예:  v_empno      number(10)
    
 3. 날짜형 변수 :  날짜 데이터를 담는 변수
    예:  v_hiredate    date
    
숫자를 4개를 물어보게 하고 4개의 숫자의 합을 출력하시오. 

set  serveroutput  on 
set verify off 
accept   p_num1   prompt   '첫 번째 숫자를 입력하세요 ~'
accept   p_num2  prompt    '두 번째 숫자를 입력하세요 ~'
accept   p_num3   prompt   '세 번째 숫자를 입력하세요 ~'
accept   p_num4   prompt   '네 번째 숫자를 입력하세요 ~'
-- 외부 변수들 

declare 
    v_sum       number(10);
-- declare와 end 사이에 있는 변수는 내부 변수, 나머지는 모두 외부 변수 
begin
    v_sum :=  &p_num1 +  &p_num2 + &p_num3 + &p_num4;
-- &를 붙여줘야 외부 변수를 내부에서 쓸 수 있다. 
    
    dbms_output.put_line('총합은 :  '  ||  v_sum );

end;
/