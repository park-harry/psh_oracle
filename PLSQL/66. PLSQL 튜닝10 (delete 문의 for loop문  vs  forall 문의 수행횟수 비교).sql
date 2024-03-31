- �׽�Ʈ�� ���̺� ����
drop table emp  PURGE;

CREATE TABLE emp AS
    SELECT empno, sal, deptno,
        LPAD(ename, 5, ename) AS ename,
        LPAD(addr, 5, addr) AS addr
    FROM (
        SELECT LEVEL + 10000000 AS empno,
        MOD(LEVEL, 1000) + 10000 AS sal,
        CASE WHEN MOD(LEVEL, 4) = 0 THEN 10
        WHEN MOD(LEVEL, 4) = 1 THEN 20
        WHEN MOD(LEVEL, 4) = 2 THEN 30
        WHEN MOD(LEVEL, 4) = 3 THEN 40
        END AS deptno,
        CHR(97 + MOD(LEVEL, 26)) AS ename,
        CHR(65 + MOD(LEVEL, 26)) AS addr
        FROM DUAL
        CONNECT BY LEVEL <= 200000)
WHERE deptno IN (10, 20, 30, 40);

select deptno, count(*)
from  emp
group by deptno;

- for loop ���� ������� ���� ���ν����� delete ����
CREATE OR REPLACE PROCEDURE for_delete_deptno
IS
    TYPE trd_emp IS RECORD (deptno emp.deptno%TYPE, sal emp.sal%TYPE);
    TYPE tnt_emp IS TABLE OF trd_emp;
    v_emp tnt_emp;

    TYPE tnt_deptno IS TABLE OF emp.deptno%TYPE;
    v_deptno tnt_deptno := tnt_deptno(10, 20, 30, 40);

BEGIN
    FOR i IN v_deptno.FIRST .. v_deptno.LAST LOOP
        DELETE /*+ FOR */ FROM emp
        WHERE deptno = v_deptno(i)
        RETURNING  max(deptno), SUM(sal) BULK COLLECT INTO v_emp;
        
        FOR j IN 1 .. v_emp.COUNT LOOP
            DBMS_OUTPUT.put_line(v_emp(j).deptno || chr(9) || v_emp(j).sal);
        END LOOP;
    END LOOP;
END;
/

exec for_delete_deptno;

col sql_text for a20

SELECT sql_id, sql_text, executions, program_line#
FROM v$sql
WHERE sql_text LIKE 'DELETE /*+ FOR */ %';

- �ٽ� emp ���̺��� ����� �Ѵ�.
drop table emp  PURGE;

CREATE TABLE emp AS
    SELECT empno, sal, deptno,
        LPAD(ename, 5, ename) AS ename,
        LPAD(addr, 5, addr) AS addr
    FROM (
        SELECT LEVEL + 10000000 AS empno,
        MOD(LEVEL, 1000) + 10000 AS sal,
        CASE WHEN MOD(LEVEL, 4) = 0 THEN 10
        WHEN MOD(LEVEL, 4) = 1 THEN 20
        WHEN MOD(LEVEL, 4) = 2 THEN 30
        WHEN MOD(LEVEL, 4) = 3 THEN 40
        END AS deptno,
        CHR(97 + MOD(LEVEL, 26)) AS ename,
        CHR(65 + MOD(LEVEL, 26)) AS addr
        FROM DUAL
        CONNECT BY LEVEL <= 200000)
WHERE deptno IN (10, 20, 30, 40);

select deptno, count(*)
from  emp
group by deptno;

- forall ���� ������� ���� ���ν����� delete ����
CREATE OR REPLACE PROCEDURE forall_delete_deptno
IS
    type trd_emp  is  record(deptno emp.deptno%type, sal emp.sal%type);
    type tnt_emp  is table of trd_emp;
    v_emp   tnt_emp;
    
    type  tnt_deptno is  table of  emp.deptno%type;
    v_deptno  tnt_deptno := tnt_deptno( 10, 20, 30, 40 );

BEGIN
    FORALL i  in   v_deptno.first .. v_deptno.last
        DELETE /*+ FOR_ALL */ FROM emp
        WHERE  deptno = v_deptno(i)
        RETURNING  max(deptno), sum(sal) BULK COLLECT INTO  v_emp;
        
        FOR  i IN 1 .. v_emp.COUNT LOOP
        DBMS_OUTPUT.put_line (v_emp(i).deptno ||chr(9) || v_emp(i).sal );
    END LOOP;
END;
/

exec forall_delete_deptno;
=>  delete�Ҷ��� forall ���� for�� �� ������. 

col sql_text for a20

SELECT sql_id, sql_text, executions, program_line#
FROM v$sql
WHERE sql_text LIKE 'DELETE /*+ FOR_ALL */ %';


���� 1. ���� forall���� ����� ���ν����� �̿��ؼ� dept ���̺��� ��� �����͸� �ѹ��� ����ڱ� 
���ν����� ����� �����Ͻÿ�. 
CREATE OR REPLACE PROCEDURE forall_delete_dept
IS
 
    type  tnt_deptno is  table of  dept.deptno%type;
    v_deptno  tnt_deptno := tnt_deptno( 10, 20, 30, 40 );

BEGIN
    FORALL i  in   v_deptno.first .. v_deptno.last
        DELETE /*+ FOR_ALL */ FROM dept
        WHERE  deptno = v_deptno(i);       
END;
/

exec forall_delete_dept;

select * from dept;