DB 관리에 대한 트리거
=> DB 에 로그인 또는 로그아웃을 했을때
=> DB 를 shutdown 이나 startup 했을때
=> 위의 작업을 했을 때 누가 했는지 그 정보를 테이블에 저장할 수 있다.

시작하기 전에 모든 trigger drop하기 
- login trigger 생성
CREATE TABLE logon_inform
(user_id     VARCHAR2(10),
log_date    TIMESTAMP,
action      VARCHAR2(20)
);

CREATE OR REPLACE TRIGGER logon_trace
AFTER LOGON ON DATABASE -- logon on databse: db에 접속헀을때 작동 되는 trigger
BEGIN
    INSERT INTO logon_inform
    VALUES ( USER, SYSTIMESTAMP, '로그인 했음');

END;
/

- 접속한 후 logon_inform 테이블 확인해보기 
sqlplus scott/tiger
select * from logon_inform;

문제 1. 아래의 테이블을 생성하고 db에 log off 했을 때 그 정보가 아래의 테이블에 입력되게 하시오. 
create table logoff_inform 
(user_id varchar2(10),
log_date timestamp, 
action varchar2(20))

create or replace trigger logoff_trace 
before lofogg on database  => logon on database : db에 접속 했을 때 작동 되는 trigger 

begin 

end; 
/

exit; 
select * from logoff_inform; 

※ 어느 컴퓨터에서 오라클 접속을 시도했는지 확인하려면
SELECT sid, serial#, username, status, terminal 
FROM v$session
WHERE USERNAME = 'C##SCOTT'; => 대문자로 써야 한다. 

=> sid: c##scott이 여러 개니까 어디 세션에 있는 user 인지를 보여줌. 
=> status: 계정의 상태 
=> terminal: 컴퓨터 이름 