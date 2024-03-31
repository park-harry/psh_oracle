pragma autonomous_transaction �ɼ�
=> ���ν��� ������ ȣ���ϴ� �ٸ� ���ν����� transaction �� ������ ������ transaction 
	(insert,  update ���) ���� ����Ϸ� �� �� ����ϴ� �ɼ�

����1. �Ʒ��� ���̺��� �����ϰ� �����͸� �Է��Ѵ�.
CREATE TABLE log_table
(username    VARCHAR2(10),
message     VARCHAR2(50) );

INSERT INTO log_table
VALUES ( user,'test �Դϴ�');

SELECT * FROM log_table;

����2. ���� log_table �� data �� �Է��ϴ� ���ν����� �����ϴµ�, �Ʒ��� ���� ���ν�����
�����ϸ� data �� �ԷµǴ� ���ν����� �����Ͻÿ�. (commit ������)
CREATE OR REPLACE PROCEDURE log_insert
( p_msg VARCHAR2 )
IS
BEGIN
    INSERT INTO log_table
    VALUES ( user,  p_msg );
    COMMIT;
end;
/

exec log_insert('�ι�° test �Դϴ�.');

select * from log_table;

����3. �μ����̺� data �� �Է��ϴ� ���ν����� �����Ͻÿ�. (commit ���� ����)
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

���� 4. dept_insert ���ν������� log_insert ���ν����� ȣ���ϴ� ���� �߰��ϱ�
create or replace procedure dept_insert 
(p_deptno dept.deptno%type, p_loc dept.loc%type)
is
begin
    insert into dept(deptno, loc)
    values(p_deptno, p_loc);
    
    log_insert('����° test �Դϴ�.');
end;
/

select * from dept;
execute dept_insert(60, 'busan');
=> dept_insert �ȿ� �ִ� log_insert �ȿ� commit�� �ֱ� ������ rollback�� ���� �ʴ´�. 

rollback;
select * from dept;

�� Ʈ�����(transaction) �̶�?
=> �۾�(DML ���� : INSERT, UPDATE, DELETE, MERGE) �� ����.
	 COMMIT �̶� ROLLBACK �� �ϸ� �۾��� ���ᰡ ��.
	 
���� 5. pragma autonomous_transaction ������ �����ؼ� log_insert ���ν��� ���� DML ����
������ Ʈ������� ���� �׽�Ʈ �Ͻÿ� !
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

=> pragma autonomous_transaction ������ rollback�� �ȴ�. 
=> log_insert�� ������ transaction�� �ƴ�. 