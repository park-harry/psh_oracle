execute immediate ���� ��� �� ���� ��

CREATE OR REPLACE PROCEDURE find_ename
( p_empno  emp.empno%TYPE )
IS
	v_emp      emp%ROWTYPE;
BEGIN
    select * into v_emp
    from emp
    where empno = p_empno;
    DBMS_OUTPUT.PUT_LINE( '�̸� : ' || v_emp.ename || chr(9) || '���� : ' || v_emp.sal );
END;
/

exec  find_ename(7788);

execute immediate ���� ������� ��

CREATE OR REPLACE PROCEDURE find_ename2
( p_empno  emp.empno%TYPE )
IS
    v_stmt      VARCHAR2(200);
    v_emp      emp%ROWTYPE;
BEGIN
    v_stmt := 'SELECT * FROM  emp
               WHERE empno = :eno';
               -- :eno -> ���ε� ���� (�ƹ��ų� �ᵵ �ȴ�.) 
               -- select .. into ���� �ƴ϶� select ���̴�. 
    EXECUTE IMMEDIATE v_stmt INTO v_emp USING p_empno;
    -- 
    DBMS_OUTPUT.PUT_LINE( '�̸� : ' || v_emp.ename || chr(9) || '���� : ' || v_emp.sal );
END;
/
exec find_ename2(7566);
exec find_ename2(7788);