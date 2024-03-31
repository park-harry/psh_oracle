예제 1. 사원 테이블에 bonus 컬럼을 number(10,2) 로 해서 추가하시오 !
ALTER TABLE emp
ADD bonus number(10,2);

예제 2. 사원번호, 이름, 월급을 입력해서 프로시저를 실행하면 사원 테이블에 해당 사원의 사원번호,
 이름, 월급, 보너스가 입력되게 하는 프로시저를 만드는데, 보너스는 입력하는 월급의 20%로 입력되게
 하시오! 
CREATE OR REPLACE PROCEDURE pro1
( p_empno   IN emp.empno%TYPE, 
  p_ename   IN emp.ename%TYPE,
  p_sal     IN emp.sal%TYPE )
  -- IN (input의 약자) 입력 매개변수를 나타내는 키워드 
  -- out - 출력 매개변수 
  -- default 값이 in (in 은 생략가능) 
IS
BEGIN
    INSERT INTO emp ( empno, ename, sal, bonus )
    VALUES ( p_empno, p_ename, p_sal, p_sal * 0.2 );
END;
/

execute pro1(8899, 'JANE', 3000);

SELECT ename, sal, bonus
FROM emp;

문제 1. 위의 프로시저를 수정해서 프로시저를 실행하고 나면 바로 입력한 사원의 이름과 보너스가 
출력되게 하시오.
- returning 절을 사용 안했을 때:
CREATE OR REPLACE PROCEDURE pro1
( p_empno   IN emp.empno%TYPE, 
  p_ename   IN emp.ename%TYPE,
  p_sal     IN emp.sal%TYPE )

IS
    v_bonus emp.bonus%type;
BEGIN
    INSERT INTO emp ( empno, ename, sal, bonus )
    VALUES ( p_empno, p_ename, p_sal, p_sal * 0.2 );
    
    select bonus into v_bonus 
    from emp 
    where empno = p_empno;
    dbms_output.put_line('입력한 사원 '||p_ename||
                        '의 보너스는 '||v_bonus||' 입니다');
END;
/
set serveroutput on
execute pro1(8899, 'JANE', 3000);

-- returning 절을 사용 했을 때:
CREATE OR REPLACE PROCEDURE pro1
( p_empno   IN emp.empno%TYPE, 
  p_ename   IN emp.ename%TYPE,
  p_sal     IN emp.sal%TYPE )

IS
    v_bonus emp.bonus%type;
BEGIN
    INSERT INTO emp ( empno, ename, sal, bonus )
    VALUES ( p_empno, p_ename, p_sal, p_sal * 0.2 )
    returning bonus into v_bonus;

    dbms_output.put_line('입력한 사원 '||p_ename||
                        '의 보너스는 '||v_bonus||' 입니다');
END;
/
set serveroutput on
execute pro1(5555, 'JANE', 3000)

문제 2. 부서(dept) 테이블에 데이터를 입력하는 프로시져를 생성하는데 프로시져를 실행하면 입력되는
데이터가 바로 출력되게하시오.
CREATE OR REPLACE PROCEDURE pro1
( p_deptno   IN dept.deptno%TYPE, 
  p_dname   IN dept.dname%TYPE,
  p_loc     IN dept.loc%TYPE )

IS
   v_deptno     dept.deptno%type;
   v_dname      dept.dname%type;
   v_loc        dept.loc%type;
BEGIN
    INSERT INTO dept ( deptno, dname, loc)
    VALUES ( p_deptno, p_dname, p_loc )
    returning deptno, dname, loc into v_deptno, v_dname, v_loc;

    dbms_output.put_line(v_deptno||chr(9)||v_dname||chr(9)||v_loc);
END;
/
set serveroutput on
exec pro1(50,'hr','seoul');