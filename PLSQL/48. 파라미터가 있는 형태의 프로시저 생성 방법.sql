- 입력 파라미터가 있는 프로시저 문법
create  [ or replace ] procedure [ 프로시져 이름 ]
( 입력 매개 변수   데이터 타입 )
is | as
		[ 선언부 ]
begin
		[ 실행부 ]
		exception
		[ 예외 처리부 ]
end [ 프로시져 이름 ];


- 프로시저 생성 예제
1. demo.sql 을 수행해서 emp 와 dept 테이블을 초기화 시킨다
프로시저가 아닌 익명 PL/SQL 코드

set serveroutput on
set verify off
accept   p_deptno   prompt   '부서번호를 입력하세요 ~ '
declare
    v_deptno     emp.deptno%type :=  &p_deptno;
    v_sumsal      number(10,2) ;

begin
    select   sum(sal)   into   v_sumsal
    from   emp
    where   deptno =  v_deptno ;
    
    dbms_output.put_line ( '토탈월급은 : '  ||  v_sumsal  );
end;
/

프로시저를 사용했을때의 코드
create or replace procedure  pro1
( p_deptno   emp.deptno%type )
is
    v_deptno     emp.deptno%type :=  p_deptno;
    v_sumsal      number(10,2) ;
begin
    select   sum(sal)   into   v_sumsal
    from   emp
    where   deptno =  v_deptno ;
    
    dbms_output.put_line ( '토탈월급은 : '  ||  v_sumsal  );
end;
/

프로시저 수행하는 방법
set serveroutput on
exec pro1(10);


실습 환경 구성 
drop table high_sal;
drop table normal_sal;

create  table  high_sal
( deptno    number(10),
sumsal    number(10,2) );

create  table  normal_sal
( deptno   number(10),
sumsal   number(10,2) );


문제 1. 부서번호를 입력하게하고 부서번호의 토탈월급이 10000 이상이면 high_salary 테이블에 
부서번호와 토탈월급이 입력되게하고10000 보다 작으면 normal_salary 테이블에 입력되게하는 아래의
익명 PL/SQL 을 프로시져로 변경하시오 
set serveroutput on 
accept p_deptno prompt '부서번호를 입력하시오.'
declare 
    v_deptno    emp.deptno%type:= p_deptno;
    v_sumsal    number(10,2);
begin 
    select sum(sal) into v_sumsal
    from emp 
    where deptno = v_deptno;
    
    if v_sumsal >= 10000 then 
        insert into high_sal 
        values(v_deptno, v_sumsal);
    else
        insert into normal_sal
        values(v_deptno, v_sumsal);
    end if;
    commit;
end;
/

- 답: 
create or replace procedure pro1
(p_deptno emp.deptno%type)
is
    v_deptno    emp.deptno%type:= p_deptno;
    v_sumsal    number(10,2);
begin 
    select sum(sal) into v_sumsal
    from emp 
    where deptno = v_deptno;
    
    if v_sumsal >= 10000 then 
        insert into high_sal 
        values(v_deptno, v_sumsal);
    else
        insert into normal_sal
        values(v_deptno, v_sumsal);
    end if;
    commit;
end;
/

exec pro1(10);
exec pro1(20);
select * from high_sal;
select * from normal_sal;