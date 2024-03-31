※ returning into 절만 사용했을 때 : 하나의 행의 값만 변수에 입력할 수 있다.

INSERT INTO emp ( empno, ename, sal, bonus )
VALUES ( p_empno, p_ename, p_sal, p_sal * 0.2 )
RETURNING bonus INTO v_bonus;

※ returning bulk collect into 절을 사용했을 때: 여러 개의 행의 값들을 변수에 담을 수 있다
문제 1. emp 테이블의 구조를 담는 emp_t 테이블을 생성한다.
create table emp_t 
 as 
     select * 
     from  emp 
     where 1=2;
     
문제 2. 부서번호를 입력해서 프로시져를 실행하면 해당 부서번호의 모든 사원들의 데이터가 emp 테이블
에서 emp_t 테이블에 입력되게 프로시져를 생성하시오. 
create or replace procedure insert_emp_t
(p_deptno   emp.deptno%type)
is 
begin 
    insert into emp_t 
    select * 
    from emp 
    where deptno = p_deptno;
end;
/
exec insert_emp_t(20);

delete from emp_t;
commit;

문제 3. insert 문에 return bulk collect into 절을 사용하여 입력된 데이터가 모두 출력되게 하시오.
create or replace procedure insert_emp_t
(p_deptno   emp.deptno%type)
is 
    type trd_emp is table of emp%rowtype; -- emp의 rowtype을 모두 카피한다. 
    type tnt_emp is table of trd_emp;
    v_emp       tntemp;
begin 
    insert into emp_t 
    select * 
    from emp 
    where deptno = p_deptno
    return empno,ename,job,mgr, hiredate, sal, comm, deptno 
         bulk collect into v_emp;
end;
/

=> 아래와 같이 에러가 발생한다. 
=> insert에서는 returning bulk collect into가 안된다. 