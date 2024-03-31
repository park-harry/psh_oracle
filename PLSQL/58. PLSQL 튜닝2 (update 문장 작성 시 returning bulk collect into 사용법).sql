���� ���� �ѹ��� update �ϰ� �� ������ ��� ��� 

���� 1. 
CREATE OR REPLACE PROCEDURE pro239
( p_deptno emp.deptno%TYPE )
IS
    type trd_emp is record(ename  emp.ename%type, sal emp.sal%type);
    type tnt_emp is table of trd_emp;
    v_emp  tnt_emp;
BEGIN
    UPDATE emp
    SET sal = sal * 2
    WHERE deptno = p_deptno
    RETURNING ename, sal BULK COLLECT INTO v_emp;
    
    for i  in 1 .. v_emp.COUNT loop
        DBMS_OUTPUT.PUT_LINE (v_emp(i).ename || chr(9) || v_emp(i).sal );
    end loop;
end;
/
exec pro239(10);

���� 2. ���� ������ �����ؼ� ������ ���� ��� ���� ���ŵǾ����ϴ�. ��� �޼�����
��µǰ� �Ͻÿ�. 
CREATE OR REPLACE PROCEDURE pro239
( p_deptno emp.deptno%TYPE )
IS
    type trd_emp is record(ename  emp.ename%type, sal emp.sal%type); -- ���ڵ� 
    type tnt_emp is table of trd_emp; -- collection- ��ø ���̺�
    v_emp  tnt_emp;
BEGIN
    UPDATE emp
    SET sal = sal * 2
    WHERE deptno = p_deptno
    RETURNING ename, sal BULK COLLECT INTO v_emp;
    
    for i  in 1 .. v_emp.COUNT loop
        DBMS_OUTPUT.PUT_LINE (v_emp(i).ename||chr(9)||v_emp(i).sal);
    end loop;
    DBMS_OUTPUT.PUT_LINE (sql%rowcount||'���� ���ŵǾ����ϴ�.');
end;
/
exec pro239(10);