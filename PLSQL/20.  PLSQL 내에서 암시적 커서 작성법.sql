프로시져를 생성하고 실행하면 ‘성공적으로 수행되었다’ 라는 메세지가 출력 된다. 
그런데 UPDATE  문이 포함된 프로시져의 경우 몇 개의 행이 갱신 되었다 라고 메세지가 출력 되면 
데이터가 잘 갱신 되었다는 것을 확실히 알 수 있을 텐데 그런 말은 없고 그냥 성공적으로 수행되었다고만
출력된다.

예제.
create   or  replace   procedure    update_deptno
		(  p_deptno     emp.deptno%type )
as
		begin
			update    emp
			set   comm=9000
			where  deptno= p_deptno;
    commit;
end;
/

execute  update_deptno(20);

그래서 오라클 에서는 암시적 커서 함수를 제공하고 있다. 
암시적 커서 함수를 이용하면 몇 건이 갱신되었다 라고 출력해준다.

※ 암시적 커서의 종류 3가지
1. SQL%FOUND : 가장 최근에 수행한 SQL문이 한 행 이상 영향을 받은 경우 TRUE
2. SQL%NOTFOUND : 가장 최근에 수행한 SQL문이 한 행에도 영향을 받지 않은 경우 TRUE
3. SQL%ROWCOUNT : 가장 최근의 SQL문에 의해 영향은 받은 행의 개수를 리턴하는 함수

문제 1. 다음의 프로시져에 암시적 커서를 이용하여 몇건의 행이 지워졌다라는 메세지가 출력되게 
하시오.
set serveroutput on 
create    or   replace    procedure     delete_deptno
		( p_deptno   number )
is
		begin
		delete    from    emp
		where   deptno = p_deptno;
    dbms_output.put_line( SQL%rowcount  || '행이 지워졌습니다. ' );
    commit;
end;
/

exec delete_deptno(20);

문제 2. 다음의 프로시져에 암시적 커서를 이용하여 몇건의 행이 갱신되었다라는 메세지가 출력되게 
하시오.
set serveroutput on 
create   or  replace   procedure    update_deptno
		(p_deptno     emp.deptno%type )
as
		begin
		update    emp
		set   comm=9000
		where  deptno= p_deptno;
		dbms_output.put_line(SQL%rowcount || '행이 갱신되었습니다.');
		commit;
end;
/

exec update_deptno(20);