예제 1. 사원번호를 입력하면 해당 사원의 모든 컬럼의 데이터가 출력되는 프로시져를 생성하시오. 
create or replace  procedure  pro2
( p_empno   emp.empno%type )
is
    type   t_rec   is   record
    (empno      emp.empno%type,
    ename      emp.ename%type,
    job          emp.job%type,
    mgr         emp.mgr%type,
    hiredate    emp.hiredate%type,
    sal           emp.sal%type,
    comm       emp.comm%type,
    deptno     emp.deptno%type );
v_myrec   t_rec;
begin
    select   *   into   v_myrec
    from  emp
    where  empno =  p_empno;

    dbms_output.put_line ( v_myrec.empno ||chr(9)||
                            v_myrec.ename ||chr(9)||
                            v_myrec.job      ||chr(9)||
                            v_myrec.mgr    ||chr(9)||
                            v_myrec.hiredate ||chr(9)||
                            v_myrec.sal     ||chr(9)||
                            v_myrec.comm ||chr(9)||
                            v_myrec.deptno );
end;
/
set serveroutput on 
 exec pro2(7788);

문제 1. 위의 코드를 %rowtype을 이용해서 다시 간단하게 작성하시오. 
create or replace  procedure  pro2
( p_empno   emp.empno%type )
is  
    v_myrec   emp%rowtype;
begin
    select   *   into   v_myrec
    from  emp
    where  empno =  p_empno;

    dbms_output.put_line ( v_myrec.empno ||chr(9)||
                            v_myrec.ename ||chr(9)||
                            v_myrec.job      ||chr(9)||
                            v_myrec.mgr    ||chr(9)||
                            v_myrec.hiredate ||chr(9)||
                            v_myrec.sal     ||chr(9)||
                            v_myrec.comm ||chr(9)||
                            v_myrec.deptno );
end;
/

exec pro2(7788);

문제 2. 부서번호를 입력하고 프로시져를 수행하면 dept 테이블의 해당 부서번호의 모든 컬럼을 출력하는 
프로시져를 생성하시오.
create or replace  procedure  pro_dept
( p_deptno  dept.deptno%type )
is  
    v_myrec   dept%rowtype;
begin
    select   *   into   v_myrec
    from  dept
    where  deptno =  p_deptno;

    dbms_output.put_line ( v_myrec.deptno ||chr(9)||
                            v_myrec.dname ||chr(9)||
                            v_myrec.loc );
end;
/
set serveroutput on
exec pro_dept(10);

문제 3-1. emp18 테이블의 구조를 담는 emp18_backup7 테이블을 생성한다.
drop   table  emp18_backup7; 

create  table  emp18_backup7
as
    select  *
    from emp18
    where 1 = 2;
    
문제 3-2. 아래의 스크립트를 참고해서 emp18 테이블의 모든 데이터를 emp18_backup7 테이블에 입력하는
프로시져를 pro1 이라는 이름으로 생성한다.
create or replace procedure  pro1
is
    TYPE tnt_dept IS TABLE OF dept%ROWTYPE;
    v_dept   tnt_dept;

BEGIN

    select  *  BULK COLLECT INTO v_dept
       from  dept;

    FOR i IN v_test.FIRST .. v_test.LAST LOOP
        INSERT /*+ FOR  */  INTO test_backup VALUES v_test(i);
    END LOOP;

END;
/

문제 3-3. 위의 스크립트를 참고해서 만든 for loop문을 forall 문으로 변경하시오. 
create or replace procedure  pro1
is
    TYPE tnt_emp18 IS TABLE OF emp18%ROWTYPE;
    v_emp18   tnt_emp18;
BEGIN
    select  *  BULK COLLECT INTO v_emp18
       from  emp18;

    forall i IN v_emp18.FIRST .. v_emp18.LAST
        INSERT /*+ for_all  */  INTO emp18_backup7 VALUES v_emp18(i);
END;
/

exec pro1;
select * from emp18_backup7;