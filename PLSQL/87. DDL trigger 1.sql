※ DDL 트리거
=> DDL 명령어 ~> CREATE, ALTER, DROP, TRUNCATE, RENAME

예제 1. SCOTT 유저에 테이블을 DROP 할때에 DROP 하지 못하도록 트리거를 생성하시오 !
CREATE OR REPLACE TRIGGER no_ddl
BEFORE DROP OR TRUNCATE ON c##SCOTT.SCHEMA
BEGIN
	RAISE_APPLICATION_ERROR( -20001, '테이블을 DROP 하지 마세요 ~~' );
END;
/

DROP TABLE emp;

문제 1.  사원 테이블에 월급에 인덱스를 생성하시오 ! 
 create  index  emp_sal
on  emp(sal);

drop index emp_sal;
=> 에러 발생하면 정상 