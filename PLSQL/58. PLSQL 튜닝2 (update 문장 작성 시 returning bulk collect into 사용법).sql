여러 건을 한번에 update 하고 그 수정된 결과 출력 

예제 1. 
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

예제 2. 위의 예제를 수정해서 다음과 같이 몇개의 행이 갱신되었습니다. 라는 메세지가
출력되게 하시오. 
CREATE OR REPLACE PROCEDURE pro239
( p_deptno emp.deptno%TYPE )
IS
    type trd_emp is record(ename  emp.ename%type, sal emp.sal%type); -- 레코드 
    type tnt_emp is table of trd_emp; -- collection- 중첩 테이블
    v_emp  tnt_emp;
BEGIN
    UPDATE emp
    SET sal = sal * 2
    WHERE deptno = p_deptno
    RETURNING ename, sal BULK COLLECT INTO v_emp;
    
    for i  in 1 .. v_emp.COUNT loop
        DBMS_OUTPUT.PUT_LINE (v_emp(i).ename||chr(9)||v_emp(i).sal);
    end loop;
    DBMS_OUTPUT.PUT_LINE (sql%rowcount||'행이 갱신되었습니다.');
end;
/
exec pro239(10);