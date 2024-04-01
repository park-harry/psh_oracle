예제. 
create or replace procedure  pro1
is
    TYPE tnt_dept IS TABLE OF dept%ROWTYPE;
    v_dept   tnt_dept;
BEGIN
    select  * BULK COLLECT INTO v_dept
    from  dept;

    FOR  i  IN  v_dept.FIRST .. v_dept.LAST LOOP
        DBMS_OUTPUT.PUT_LINE (v_dept(i).deptno || ': ' || v_dept(i).loc);
    END LOOP;
END;
/

exec pro1;

문제 1. emp 테이블에서 이름과 월급을 출력하는 중첩 테이블을 사용한 프로시져를 생성하시오.
create or replace procedure  pro1
is
    TYPE tnt_emp IS TABLE OF emp%ROWTYPE;
    v_emp  tnt_emp;
BEGIN
    select  * BULK COLLECT INTO v_emp
    from  emp;

    FOR  i  IN  v_emp.FIRST .. v_emp.LAST LOOP
        DBMS_OUTPUT.PUT_LINE (v_emp(i).ename || ': ' || v_emp(i).sal);
    END LOOP;
END;
/
set serveroutput on
exec pro1;

문제 2. 조합 변수 collection을 활용하여 프로시져를 생성하시오. 
다음과 같이 통신사를 입력해서 수행하면 해당 통신사의 학생들의 이름, 나이, 통신사가 출력되게 하시오. 
create or replace procedure show_telecom
(p_telecom  emp18.telecom%type)
is 
    type t_emp18 is table of emp18%rowtype;
    v_emp18 t_emp18;
begin 
    select * bulk collect into v_emp18 
    from emp18
    where lower(telecom)= lower(p_telecom);
    
    for i in v_emp18.first..v_emp18.last loop
        dbms_output.put_line(v_emp18(i).ename||chr(9)|| 
                            v_emp18(i).age ||chr(9)|| 
                            v_emp18(i).telecom);
    end loop;
end;
/

set serveroutput on
exec show_telecom('sk');

문제 3. 조합 변수 컬렉션을 활용하여 다음과 같이 이메일 도메인을 입력해서 프로시져를 수행하면 해당 
도메인의 학생들의 이름과 나이와 이메일이 출력 되게 하시오.
exec  show_domain('naver');

create or replace procedure show_domain
(p_email  emp18.email%type)
is 
    type t_emp18 is table of emp18%rowtype;
    v_emp18 t_emp18;
begin 
    select * bulk collect into v_emp18 
    from emp18
    where substr(email,instr(email,'@')+1,instr(email,'.')- instr(email,'@')-1)= p_email;
    
    for i in v_emp18.first..v_emp18.last loop
        dbms_output.put_line(v_emp18(i).ename||chr(9)|| 
                            v_emp18(i).age ||chr(9)|| 
                            v_emp18(i).email);
    end loop;
end;
/

set serveroutput on
exec show_domain('gmail');