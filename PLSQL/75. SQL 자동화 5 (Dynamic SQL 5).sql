PL/SQL ������ DDL ���� �����ϱ� ����
1. SYS ������ �����ؼ� c##scott �������� ������ ������ �ο��Ѵ�.
  - sqlplus sys/oracle_4U as sysdba
  - SELECT ���� �ο�
      => GRANT SELECT ON user_tables TO C##SCOTT;
  - CREATE TABLE ���� �ο�
      => GRANT CREATE TABLE TO C##SCOTT;
2. c##scott ������ �����ؼ� ���̺��� �����Ѵ�.
  - connect c##scott/tiger
  
create table  emp_backup
as
select * from  emp;

select * from emp_backup;

drop table emp_backup;

3. c##scott ������ �����ؼ� �Ʒ��� ���ν����� �����Ѵ�. 

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

=> �� ����������� Ȯ���Ѵ�.

select table_name
from  user_tables
where table_name  like '%BACKUP%';


- ���ν����� �����ߴµ� ���� ������ ���ٴ� ������ ���� ���ν����� ������ ���� �ٽ� �����Ͻÿ�.
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


���� 1.  ���̺�� BACKUP  �̶�� �ܾ �����ϰ� �ִ� ���̺���� ���  DROP �ϴ� ���ν����� 
�����Ͻÿ�.
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
=> 0���� ������ �����̴�. 