예제 1-1. 다음의  insert 문장을 실행하는 프로시져를 생성합니다.
insert   into   emp(empno, ename, sal )
values( 1122,  'JAMES',  3000 );

--프로시져를 생성한다.
create  or  replace  procedure   insert_emp
as
		begin
				insert   into   emp(empno, ename, sal )
				values(  1122,  'JAMES',  3000 );
		end;
/

예제 1-2. 프로시져를 실행한다.
execute   insert_emp;
select * from emp;

문제 1. 위의 프로시져를  실행할 때 사원 테이블에 입력할 입력값을 직접 입력할 수 있게 수정하시오.
execute   insert_emp(1234, 'JACK', 4000);
execute   insert_emp(1235, 'JANE', 5000);
-- 위의 2개만 입력하면 error 발생 

create  or replace  procedure    insert_emp
		( p_empno   emp.empno%type,
		p_ename  emp.ename%type,
		p_sal       emp.sal%type ) -- 입력 parameter(매개) 변수 
as
		begin
		insert   into   emp(empno, ename, sal )
		values( p_empno, p_ename, p_sal );
		end;
/

execute   insert_emp(1234, 'JACK', 4000);
select * from emp;

문제 2. dept 테이블에 데이터를 입력하는 프로시져를 생성하시오.
exec  insert_dept(50,'HR', 'SEOUL');

create or replace procedure insert_dept
		(p_deptno dept.deptno%type,
		p_dname  dept.dname%type,
		p_loc    dept.loc%type)
as
		begin
		insert into dept(deptno, dname, loc)
		values (p_deptno, p_dname, p_loc);
		end;
/