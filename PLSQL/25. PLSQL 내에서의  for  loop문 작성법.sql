- for loop 문법
begin
		for 카운터변수  in  반복할 범위  loop
		실행문;
		end  loop;
end;
/
=> 3가지 loop문 중에 코드가 가장 심플한 반복문이다. (가장 많이 사용) 

문제 1. for loop 문을 이용해서 아래의 문장을 7번 반복 출력하세요.
PL/SQL 을 사용하여 DB업무를 자동화 합니다.

구현결과:
PL/SQL 을 사용하여 DB업무를 자동화 합니다.
PL/SQL 을 사용하여 DB업무를 자동화 합니다.
PL/SQL 을 사용하여 DB업무를 자동화 합니다.
PL/SQL 을 사용하여 DB업무를 자동화 합니다.
PL/SQL 을 사용하여 DB업무를 자동화 합니다.
PL/SQL 을 사용하여 DB업무를 자동화 합니다.
PL/SQL 을 사용하여 DB업무를 자동화 합니다. 

begin
		for   i    in    1 .. 7  loop
			dbms_output.put_line('PL/SQL 을 사용하여 DB업무를 자동화 합니다.');
		end  loop;
end;
/

문제 2. 1~50 까지의 숫자를 출력하는데 홀수만 출력하시오. (for loop 사용) 
begin 
    for i in 1..50 loop 
        if mod(i,2)=1 then 
            dbms_output.put_line(i);
        end if;
    end loop;
end;
/

문제 3. for loop 문을 이용해서 구구단 7단을 출력하시오. 
begin 
    for i in 1..9 loop
        dbms_output.put_line('7 x '|| i||' = '|| 7*i);
    end loop;
end;
/

문제 4. 이름을 물어보게 하고 이름을 입력하면 해당 사원의 월급이 3000 이상이면 고소득자 라는 글씨가 
출력되게 하고 3000 보다 작으면 일반 소득자라고 출력되게 하시오. 
set serveroutput on 
set verify off 
accept p_ename prompt '이름을 입력하시오.'

declare 
    v_sal emp.sal%type;
    v_ename emp.ename%type := upper('&p_ename');
begin 
    select sal into v_sal
    from emp 
    where ename = v_ename;
    
    if v_sal >= 3000 then
        dbms_output.put_line('고소득자');
    else 
        dbms_output.put_line('일반 소득자');
    end if;
end;
/



문제 5. 다음과 같이 통신사를 물어보게 하고 통신사를 입력하면 해당 통신사인 학생들의 이름, 나이, 
통신사가 출력되게 하시오. 
	통신사를 입력하세요 ~ sk 
	
set serveroutput on 
set verify off 
accept p_telecom prompt '통신사를 입력하세요: '
declare 
    cursor emp_cursor is 
    select ename, age, telecom 
    from emp18 
    where lower(telecom) = lower('&p_telecom');
begin 
    for emp18_record in emp_cursor loop
        dbms_output.put_line(emp18_record.ename||chr(9)||  
                              emp18_record.telecom);
    end loop;
end;
/

문제 6. 위의 코드를 프로시져로 만들어서 수행되게 하시오. 
	exec pro_telecom('sk')

set serveroutput on 
create or replace procedure pro_telecom
(p_telecom emp18.telecom%type)
is
    cursor emp_cursor is 
    select ename, age, telecom 
    from emp18 
    where lower(telecom) = lower('&p_telecom');
begin 
    for emp18_record in emp_cursor loop
        dbms_output.put_line(emp18_record.ename||chr(9)||
                             emp18_record.age||chr(9)||
                              emp18_record.telecom);
    end loop;
end;
/
exec pro_telecom('sk')


문제 7. 나이를 물어보게하고 나이를 입력하면 해당 학생들의 이름과 나이와 생일이 출력되게하시오.
같은 나이인 학생들의 이름과 나이와 생일을 출력할 때 생일을 ascending 하게 출력하시오.

set serveroutput on 
set verify off 
accept p_age prompt '나이를 입력하시오. '
declare 
    cursor emp18_cursor is 
    select ename, age, birth 
    from emp18 
    where age = &p_age
    order by birth;
begin 
    for emp18_record in emp18_cursor loop
        dbms_output.put_line(emp18_record.ename||chr(9)||
                             emp18_record.age||chr(9)||
                             emp18_record.birth);
    end loop;
end;
/