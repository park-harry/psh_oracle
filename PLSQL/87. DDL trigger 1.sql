�� DDL Ʈ����
=> DDL ��ɾ� ~> CREATE, ALTER, DROP, TRUNCATE, RENAME

���� 1. SCOTT ������ ���̺��� DROP �Ҷ��� DROP ���� ���ϵ��� Ʈ���Ÿ� �����Ͻÿ� !
CREATE OR REPLACE TRIGGER no_ddl
BEFORE DROP OR TRUNCATE ON c##SCOTT.SCHEMA
BEGIN
	RAISE_APPLICATION_ERROR( -20001, '���̺��� DROP ���� ������ ~~' );
END;
/

DROP TABLE emp;

���� 1.  ��� ���̺� ���޿� �ε����� �����Ͻÿ� ! 
 create  index  emp_sal
on  emp(sal);

drop index emp_sal;
=> ���� �߻��ϸ� ���� 