CREATE OR REPLACE PROCEDURE pro1
IS
    --TYPE emp_arr_typ IS TABLE OF VARCHAR2(10) INDEX BY BINARY_INTEGER; (������ ����) 
    TYPE emp_arr_typ IS VARRAY(20) OF VARCHAR2(10); -- varray ���� 
    emp_arr         emp_arr_typ := emp_arr_typ(); -- �÷��� �ʱ�ȭ

BEGIN
    select  ename  BULK COLLECT INTO emp_arr
    from  emp;
    
    FOR j IN 1..emp_arr.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(emp_arr(j));
    END LOOP;
END;
/

exec pro1;


���� 1. �̹�����  �����ȣ�� ��µǰڱ�  pro1 ���ν����� �����Ͻÿ�.
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