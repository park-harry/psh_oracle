execute immediate 절을 사용 안 했을 때

CREATE OR REPLACE PROCEDURE find_ename
( p_empno  emp.empno%TYPE )
IS
	v_emp      emp%ROWTYPE;
BEGIN
    select * into v_emp
    from emp
    where empno = p_empno;
    DBMS_OUTPUT.PUT_LINE( '이름 : ' || v_emp.ename || chr(9) || '월급 : ' || v_emp.sal );
END;
/

exec  find_ename(7788);

execute immediate 절을 사용했을 때

CREATE OR REPLACE PROCEDURE find_ename2
( p_empno  emp.empno%TYPE )
IS
    v_stmt      VARCHAR2(200);
    v_emp      emp%ROWTYPE;
BEGIN
    v_stmt := 'SELECT * FROM  emp
               WHERE empno = :eno';
               -- :eno -> 바인드 변수 (아무거나 써도 된다.) 
               -- select .. into 절이 아니라 select 절이다. 
    EXECUTE IMMEDIATE v_stmt INTO v_emp USING p_empno;
    -- 
    DBMS_OUTPUT.PUT_LINE( '이름 : ' || v_emp.ename || chr(9) || '월급 : ' || v_emp.sal );
END;
/
exec find_ename2(7566);
exec find_ename2(7788);