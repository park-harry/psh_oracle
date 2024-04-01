CREATE OR REPLACE PROCEDURE pro1
IS
    --TYPE emp_arr_typ IS TABLE OF VARCHAR2(10) INDEX BY BINARY_INTEGER; (연관법 문법) 
    TYPE emp_arr_typ IS VARRAY(20) OF VARCHAR2(10); -- varray 문법 
    emp_arr         emp_arr_typ := emp_arr_typ(); -- 컬렉션 초기화

BEGIN
    select  ename  BULK COLLECT INTO emp_arr
    from  emp;
    
    FOR j IN 1..emp_arr.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(emp_arr(j));
    END LOOP;
END;
/

exec pro1;


문제 1. 이번에는  사원번호만 출력되겠금  pro1 프로시져를 수정하시오.
CREATE OR REPLACE PROCEDURE pro1
IS
    TYPE emp_arr_typ IS VARRAY(20) OF number(10);
    emp_arr   emp_arr_typ := emp_arr_typ(); 

BEGIN
    select  empno  BULK COLLECT INTO emp_arr
    from  emp;
    
    FOR j IN 1..emp_arr.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(emp_arr(j));
    END LOOP;
END;
/

exec pro1;