DB ������ ���� Ʈ����
=> DB �� �α��� �Ǵ� �α׾ƿ��� ������
=> DB �� shutdown �̳� startup ������
=> ���� �۾��� ���� �� ���� �ߴ��� �� ������ ���̺� ������ �� �ִ�.

�����ϱ� ���� ��� trigger drop�ϱ� 
- login trigger ����
CREATE TABLE logon_inform
(user_id     VARCHAR2(10),
log_date    TIMESTAMP,
action      VARCHAR2(20)
);

CREATE OR REPLACE TRIGGER logon_trace
AFTER LOGON ON DATABASE -- logon on databse: db�� ���������� �۵� �Ǵ� trigger
BEGIN
    INSERT INTO logon_inform
    VALUES ( USER, SYSTIMESTAMP, '�α��� ����');

END;
/

- ������ �� logon_inform ���̺� Ȯ���غ��� 
sqlplus scott/tiger
select * from logon_inform;

���� 1. �Ʒ��� ���̺��� �����ϰ� db�� log off ���� �� �� ������ �Ʒ��� ���̺� �Էµǰ� �Ͻÿ�. 
create table logoff_inform 
(user_id varchar2(10),
log_date timestamp, 
action varchar2(20))

create or replace trigger logoff_trace 
before lofogg on database  => logon on database : db�� ���� ���� �� �۵� �Ǵ� trigger 

begin 

end; 
/

exit; 
select * from logoff_inform; 

�� ��� ��ǻ�Ϳ��� ����Ŭ ������ �õ��ߴ��� Ȯ���Ϸ���
SELECT sid, serial#, username, status, terminal 
FROM v$session
WHERE USERNAME = 'C##SCOTT'; => �빮�ڷ� ��� �Ѵ�. 

=> sid: c##scott�� ���� ���ϱ� ��� ���ǿ� �ִ� user ������ ������. 
=> status: ������ ���� 
=> terminal: ��ǻ�� �̸� 