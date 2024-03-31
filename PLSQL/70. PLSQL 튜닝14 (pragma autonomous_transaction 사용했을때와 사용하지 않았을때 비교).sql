pragma autonomous_transaction 옵션
=> 프로시저 내에서 호출하는 다른 프로시저에 transaction 을 별도의 독립된 transaction 
	(insert,  update 등등) 으로 사용하려 할 때 사용하는 옵션

예제1. 아래의 테이블을 생성하고 데이터를 입력한다.
CREATE TABLE log_table
(username    VARCHAR2(10),
message     VARCHAR2(50) );

INSERT INTO log_table
VALUES ( user,'test 입니다');

SELECT * FROM log_table;

예제2. 위의 log_table 에 data 를 입력하는 프로시저를 생성하는데, 아래와 같이 프로시저를
생성하면 data 가 입력되는 프로시저를 생성하시오. (commit 넣을것)
CREATE OR REPLACE PROCEDURE log_insert
( p_msg VARCHAR2 )
IS
BEGIN
    INSERT INTO log_table
    VALUES ( user,  p_msg );
    COMMIT;
end;
/

exec log_insert('두번째 test 입니다.');

select * from log_table;

예제3. 부서테이블에 data 를 입력하는 프로시저를 생성하시오. (commit 넣지 말것)
create or replace procedure dept_insert 
(p_deptno dept.deptno%type, p_loc dept.loc%type)
is
begin
    insert into dept(deptno, loc)
    values(p_deptno, p_loc);
end;
/

exec dept_insert(50, 'seoul');

select * from dept;

예제 4. dept_insert 프로시져내에 log_insert 프로시저를 호출하는 구문 추가하기
create or replace procedure dept_insert 
(p_deptno dept.deptno%type, p_loc dept.loc%type)
is
begin
    insert into dept(deptno, loc)
    values(p_deptno, p_loc);
    
    log_insert('세번째 test 입니다.');
end;
/

select * from dept;
execute dept_insert(60, 'busan');
=> dept_insert 안에 있는 log_insert 안에 commit이 있기 때문에 rollback이 되지 않는다. 

rollback;
select * from dept;

※ 트랜잭션(transaction) 이란?
=> 작업(DML 문들 : INSERT, UPDATE, DELETE, MERGE) 의 단위.
	 COMMIT 이랑 ROLLBACK 을 하면 작업이 종료가 됨.
	 
예제 5. pragma autonomous_transaction 문법을 참고해서 log_insert 프로시저 내의 DML 문이
별도의 트랜잭션이 됨을 테스트 하시오 !
CREATE OR REPLACE PROCEDURE log_insert
( p_msg VARCHAR2 )
IS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    INSERT INTO log_table
    VALUES ( user,  p_msg );
    COMMIT;
end;
/

 execute dept_insert(70, 'daejeon');
 select * from dept;
 rollback;
 select * from dept;

=> pragma autonomous_transaction 때문에 rollback이 된다. 
=> log_insert이 별도의 transaction이 됐다. 