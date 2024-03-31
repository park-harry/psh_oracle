�� ���ν����� execute immediate ���� �Ἥ ���� ���� ���� ����ϴ� ����
- execute immediate ���� �������� ��
    
CREATE OR REPLACE PROCEDURE  find_ename
( p_deptno  emp.deptno%TYPE )
IS
    type trd_emp  is  record(ename emp.ename%type, deptno emp.deptno%type);
    type tnt_emp  is table of trd_emp;
    v_emp   tnt_emp;

BEGIN
    select   ename, deptno  bulk collect  into   v_emp
    from   emp
    where   deptno = p_deptno;
    
    FOR  i IN 1 .. v_emp.COUNT LOOP
        DBMS_OUTPUT.put_line (v_emp(i).ename ||chr(9) || v_emp(i).deptno );
    END LOOP;
END;
/

set serveroutput on 
exec find_ename(10);


- execute immediate ���� ������� ��
CREATE OR REPLACE PROCEDURE  find_ename2
(p_deptno IN emp.deptno%TYPE)
IS
    type trd_emp is record(ename emp.ename%type, deptno emp.deptno%type);
    type tnt_emp is table of trd_emp;
    v_emp tnt_emp;
    v_stmt VARCHAR2(200);
BEGIN
    v_stmt := 'SELECT ename, deptno FROM emp WHERE deptno = :dno';
    
    EXECUTE IMMEDIATE v_stmt BULK COLLECT INTO v_emp USING p_deptno;
    
    FOR i IN 1 .. v_emp.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(v_emp(i).ename || CHR(9) || v_emp(i).deptno);
    END LOOP;
END;
/

���� 1. ���� ������ �ڵ带 �����ؼ� ������ �Է��ؼ� ���ν����� �����ϸ� �ش� ������ �������
�̸��� ���ް� ������ ��µǰ� ���ν����� �����ϼ���. 

CREATE OR REPLACE PROCEDURE  find_ename3
(p_job IN emp.job%TYPE)
IS
    type trd_emp is record(ename emp.ename%type, sal emp.sal%type, job emp.job%type);
    type tnt_emp is table of trd_emp;
    v_emp tnt_emp;
    v_stmt VARCHAR2(200);
BEGIN
    v_stmt := 'SELECT ename, sal,job FROM emp WHERE job = :emp_job';
    
    EXECUTE IMMEDIATE v_stmt BULK COLLECT INTO v_emp USING p_job;
    
    FOR i IN 1 .. v_emp.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(v_emp(i).ename ||cHR(9)||
														 v_emp(i).sal || chr(9)||
														 v_emp(i).job);
    END LOOP;
END;
/

exec find_ename3('SALESMAN');