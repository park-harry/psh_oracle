- 프로시저 문법
create  [ or replace ] procedure [ 프로시저 이름 ]
( 입력 매개 변수   데이터 타입 )
is | as
	[ 선언부 ]
begin
	[ 실행부 ]
	exception
	[ 예외 처리부 ]
end [ 프로시저 이름 ];
/

- 익명 PL/SQL 일 때 (이름이 없는 PL/SQL) 

set serveroutput on 
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

- 프로시져 일때

create  or replace  procedure  pro1
( p_deptno    emp.deptno%type)
is
    v_deptno     emp.deptno%type :=  p_deptno;
    v_sumsal      number(10,2) ;

begin
    select   sum(sal)   into   v_sumsal
    from   emp
    where   deptno =  v_deptno ;
    
    dbms_output.put_line ( '토탈월급은 : '  ||  v_sumsal  );
end pro1;
/
exec pro1(10);


문제 1. 위에서 생성한 PROCEDURE 목록을 SQL로 조회하시오. 
select * 
from dba_objects 
where object_type='PROCEDURE' and owner='C##SCOTT';

select object_name, status
from dba_objects 
where object_type='PROCEDURE' and owner='C##SCOTT';

=> inavlid 한게 있으면 안된다. 

alter procedure cursor_job compile; => invalid 한것을 valid 하게 만드는 코드 

alter table emp 
add grade number(10);


=> column 추가 삭제가 일어나면 column 관련 테이블 procedure들이 전부 invalid 상태가 된다. 
	 그래서 dba는 전부 valid 될 수 있게 해줘야 한다. 
	 
초급 dba: 새벽 6시 출근

중급 dba
select 'alter procedure '|| object_name||' compile;'
from dba_objects
where owner = 'C##SCOTT' and object_type='PROCEDURE' and status = 'INVALID';

고급 dba: 자동화 시킨다 