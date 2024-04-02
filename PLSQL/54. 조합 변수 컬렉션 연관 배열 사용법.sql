예제 1. 
create or replace procedure pro1
is 
    type emp_arr_typ is table of varchar2(10) index by binary_integer;
		emp_ arr    emp_arr_type;
begin
    select  ename  BULK COLLECT INTO emp_arr
    from  emp;
		=> bulk collect into: 14개의 키 값을 emp_arr에 한번에 넣는다. 
    
    for i in 1..emp_arr.count loop
        dbms_output.put_line(emp_arr(i));
    end loop;
end;
/

set serveroutput on 
exec pro1;

문제 1. 이번에는 사원번호만 출력되겠금 pro1 프로시져를 수정하시오.
create or replace procedure pro1
is 
    type emp_arr_typ is table of number(10) index by binary_integer;
    emp_arr    emp_arr_typ;
begin
    select  empno  BULK COLLECT INTO emp_arr
    from  emp;
    
    for j in 1..emp_arr.count loop
        dbms_output.put_line(emp_arr(j));
    end loop;
end;
/
set serveroutput on 
exec pro1;