문제 1-1. 사원 테이블에  부서번호가 10번인 사원들의 데이터를 지우는 PROCEDURE 를 생성하시오!
(프로시져 이름: delete_deptno)

create or replace procedure delete_deptno 
is 
		begin 
				delete from emp 
				where deptno = 10;
			commit;
		end;
/

execute  delete_deptno;

문제 1-2.  부서번호를 같이 입력해서 프로시져를 실행하면 해당 부서번호인 사원들의 데이터가 지워지게 
프로시져를 생성하세요.
 exec  delete_deptno(20);

create or replace procedure delete_deptno
		(p_deptno emp.deptno%type)
is 
		begin 
				delete from emp 
				where deptno = p_deptno;
			commit;
		end;
/