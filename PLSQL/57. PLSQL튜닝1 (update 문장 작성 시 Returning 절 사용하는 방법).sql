- 튜닝전 PL/SQL :
UPDATE emp
SET sal = sal * 2
WHERE empno = v_empno;

SELECT sal INTO v_sal
FROM emp
WHERE empno = v_empno;

- 튜닝후 PL/SQL :
UPDATE emp
SET sal = sal * 2
WHERE empno = v_empno
RETURNING sal INTO v_sal;

문제 1. 사원번호를 입력하면 해당 사원의 월급을 2배로 갱신하는 프로시저를 생성하는데
갱신 후의 월급이 와 같이 출력되게 하시오! (Returning 절 활용) 
- returning 절 활용 전 (튜닝 전) 
set timing on
create or replace procedure pro238 
(p_empno emp.empno%type)
is 
    v_sal emp.sal%type;
begin
    update emp 
    set sal = sal * 2
    where empno = p_empno;

    select sal into v_sal 
    from emp 
    where empno = p_empno;

    DBMS_OUTPUT.PUT_LINE ('수정된 월급은 : ' || v_sal );
end;
/
exec pro238(7788);

- returning 절 활용 후 (튜닝 후) 
set timing on
create or replace procedure pro238 
(p_empno emp.empno%type)
is 
    v_sal emp.sal%type;
begin
    update emp 
    set sal = sal * 2
    where empno = p_empno
    returning sal into v_sal;

    DBMS_OUTPUT.PUT_LINE ('수정된 월급은 : ' || v_sal );
end;
/
exec pro238(7788);


문제 2. 위의 예제에 프로시져를 수행할 때 다음과 같이 몇개의 행이 갱신되었다는 메세지도
같이 출력되게 코드를 추가하세요! 
set timing on
create or replace procedure pro238 
(p_empno emp.empno%type)
is 
    v_sal emp.sal%type;
begin
    update emp 
    set sal = sal * 2
    where empno = p_empno
    returning sal into v_sal;

    DBMS_OUTPUT.PUT_LINE ('수정된 월급은 : ' || v_sal );
    dbms_output.put_line(SQL%rowcount||'행이 갱신되었습니다.');
end;
/
exec pro238(7788);

문제 3. 이름을 입력해서 프로시져를 실행하면 해당 사원의 커미션이 8000으로 갱신되는 프로시져를 
생성하는데 수정된 커미션이 화면에 출력되게 하고 1건의 행이 잘 갱신되었다는 메세지도 출력되게 하시오. 
create or replace procedure update_comm
(p_ename emp.ename%type) 
is 
    v_comm emp.comm%type;
begin
    update emp 
    set comm = 8000
    where ename =upper(p_ename)
    returning comm into v_comm;
    
    dbms_output.put_line('수정된 커미션은: '||v_comm);
    dbms_output.put_line(SQL%rowcount||'행이 갱신되었습니다.');   
end;
/
exec update_comm('scott');