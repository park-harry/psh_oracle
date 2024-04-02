-  if ~ elsif  ~ else 문법 설명
begin
		if   조건1  then
				실행문1;
		elsif 조건2 then
				실행문2;
		else
				실행문3;
		end if;	
end;
/

if ~ elsif  ~ else 절 실습 예제.
set  serveroutput  on
set verify off
accept  p_a   prompt '첫번째 숫자를 입력하세요 '
accept  p_b   prompt '두번째 숫자를 입력하세요 '

declare
		v_a     number :=  &p_a;
		v_b     number :=  &p_b;
		
begin
		if   v_a > v_b then
				dbms_output.put_line( to_char(v_a) || '은 ' ||  to_char(v_b)  || ' 보다 큽니다. '  );
		elsif  v_a < v_b then
				dbms_output.put_line( to_char(v_a) || '은 ' ||  to_char(v_b)  || ' 보다 작습니다. ' );
		else
				dbms_output.put_line( to_char(v_a) || '은 ' ||  to_char(v_b)  || ' 과 같습니다. ' );
		end  if;
end;
/

문제 1. 다음과 같이 이름을 물어보게 하고 이름을 입력하면 해당 사원의 월급에 대한 등급이 출력되게하시오.

	월급이 3000 이상이면 A 등급
	월급이 2000 이상 ~ 3000 보다 작으면 B 등급
	월급이 1000 이상 ~ 2000 보다 작으면 C 등급
	나머지 월급은  D 등급

set serveroutput on 
set verify off 
accept p_ename prompt '이름을 입력하세요: '

declare 
		v_ename emp.ename%type := upper('&p_ename');
		v_sal emp.sal%type;
begin 
		select sal into v_sal 
		from emp 
		where ename = v_ename;
		
		if v_sal >= 3000 then 
			dbms_output.put_line ('A 등급');
		elsif v_sal >= 2000  then 
			dbms_output.put_line ('B 등급');
		elsif v_sal >= 1000  then 
			dbms_output.put_line ('C 등급');
		else 
			dbms_output.put_line ('D 등급');
		end if;
end;
/

다음과 같이 해당 학생이 전공자인지 비전공자인지가 출력되게 하는데 전공은 비전공자인데 before_job
에서 it 경력이 있는 전공자로 출력되게 하시오. 전공자로 출력하는 학생들은 major에 컴퓨터, 정보통신 
등의 용어가 포함된 학생들이다. 

create or replace function func10
(p_ename emp18.ename%type) 
return varchar2 
as 
    v_major emp18.major%type;
    v_before_job emp18.before_job%type;
    v_msg varchar2(20);
begin
    select major,before_job into v_major,v_before_job
    from (select ename, before_job, major
            from emp18)
    where ename = p_ename ;
    
    if (v_before_job like '%프로그래머%' or v_before_job like '%웹%' or
        v_before_job like '%클라우드%')then 
        v_msg := '전공자';
    elsif (v_major like '%컴퓨터%' or v_major like '%정보통신%' or 
        v_major like '%인공지능%' ) then 
        v_msg := '전공자';
    else 
        v_msg :='비전공자';
    end if;
    
    return v_msg;
end;
/
select ename, func10(ename)
from emp18;