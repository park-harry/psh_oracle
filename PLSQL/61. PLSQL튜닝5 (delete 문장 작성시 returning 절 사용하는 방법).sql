문제 1. 사원번호를 입력하여 프로시져를 실행하면 해당 사원번호의 데이터가 사원 테이블에서
지워지는 프로시져를 생성하는데 프로시져를 실행하면 다음과 같이 지워지는 사원의
데이터가 출력되게하시오!
create or replace procedure delete_emp
(p_empno   emp.empno%type)
is 
    v_empno emp.empno%type;
    v_ename emp.ename%type;
begin 
    delete from emp
    where empno = p_empno
    returning empno, ename into v_empno, v_ename;
    
    dbms_output.put_line(v_empno||chr(9)||v_ename);
end;
/

exec delete_emp(7788);

문제 2. 이름을 입력해서 프로시져를 실행하면 해당 사원의 데이터가 지워지게 위의 예제를 수정하시오.
create or replace procedure delete_emp
(p_ename   emp.ename%type)
is 
    v_empno emp.empno%type;
    v_ename emp.ename%type;
begin 
    delete from emp
    where ename = p_ename
    returning empno, ename into v_empno, v_ename;
    
    dbms_output.put_line(v_empno||chr(9)||v_ename);
end;
/

exec delete_emp('KING');