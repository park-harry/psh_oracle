PL/SQL 내에서 DDL 문장 수행하기 예제
1. SYS 유져로 접속해서 c##scott 유져에게 다음의 권한을 부여한다.
  - sqlplus sys/oracle_4U as sysdba
  - SELECT 권한 부여
      => GRANT SELECT ON user_tables TO C##SCOTT;
  - CREATE TABLE 권한 부여
      => GRANT CREATE TABLE TO C##SCOTT;
2. c##scott 유져로 접속해서 테이블을 생성한다.
  - connect c##scott/tiger
  
create table  emp_backup
as
select * from  emp;

select * from emp_backup;

drop table emp_backup;

3. c##scott 유져로 접속해서 아래의 프로시져를 생성한다. 

CREATE OR REPLACE PROCEDURE create_proc
IS
    CURSOR emp_cursor IS
    SELECT  table_name
    FROM user_tables;
    v_stmt      VARCHAR2(100);
BEGIN
    FOR emp_record IN emp_cursor LOOP
        v_stmt := 'create table ' || emp_record.table_name || 
                    '_backup100 as  select * from ' || emp_record.table_name ;
        
        DBMS_OUTPUT.PUT_LINE(v_stmt);
        
        EXECUTE IMMEDIATE v_stmt;
    END LOOP;
END;
/

set serveroutput on
exec create_proc;

=> 잘 만들어졌는지 확인한다.

select table_name
from  user_tables
where table_name  like '%BACKUP%';


- 프로시져를 실행했는데 만약 권한이 없다는 오류가 나면 프로시져를 다음과 같이 다시 생성하시오.
CREATE OR REPLACE PROCEDURE create_proc
authid  current_user
IS
    CURSOR emp_cursor IS
    SELECT  table_name
    FROM user_tables;
    v_stmt      VARCHAR2(100);
BEGIN
    FOR emp_record IN emp_cursor LOOP
        v_stmt := 'create table ' || emp_record.table_name || 
                    '_backup100 as  select * from ' || emp_record.table_name ;
        
        DBMS_OUTPUT.PUT_LINE(v_stmt);
        
        EXECUTE IMMEDIATE v_stmt;
    END LOOP;
END;
/

set serveroutput on
exec create_proc;


문제 1.  테이블명에 BACKUP  이라는 단어를 포함하고 있는 테이블들을 모두  DROP 하는 프로시져를 
생성하시오.
CREATE OR REPLACE PROCEDURE drop_proc
IS
    CURSOR emp_cursor IS
    SELECT  table_name
    FROM user_tables
    where table_name like '%BACKUP%';
    v_stmt      VARCHAR2(100);
BEGIN
    FOR emp_record IN emp_cursor LOOP
        v_stmt := 'drop table ' || emp_record.table_name;
        
        DBMS_OUTPUT.PUT_LINE(v_stmt);
        
        EXECUTE IMMEDIATE v_stmt;
    END LOOP;
END;
/

exec drop_proc;

select count(*) from user_tables 
where table_name like '%BACKUP%';
=> 0건이 나오면 정상이다. 