PL/SQL���� �� ��� ���� 2���� 
1. Ʈ����(trigger): Ư�� ������ �߻����� �� �ڵ����� Ư�� �̺�Ʈ�� �����ϴ� db object 
   => �� ���̺� ������ �����͸� ���� ����ȭ �� �� ���
   => OGG(Oracle Golden Gate) �� ��� �߿� ������ ����ȭ, ������ ������ �ִ�.
   => trigger �� �ʿ��� ����
     => dba ����: �������� �츮 ȸ�� �λ� db(���� ���̺�) �� �����ؼ� �ڱ��� ������ 300������ 
						      900�������� �����ߴٸ� ������ ���� � ���̰� ��� ���������� ��� ��ǻ�� 
						      �ڸ����� �����ߴ��� �̷��� Ư�� ���̺� �Էµǰ� �� �� �ִ�. Ʈ���Ÿ� �̿��ϸ�
						      �����ϴ�.
     => ������ ����: ��ȭ�� �����ϴ� ����, ���� �����Ͱ� ���� ���� ���̺� ���ÿ� �Է��� �Ǿ 
							      ���ǰ� �ջ�Ǿ �� ������� �ڵ����� ����ϴ� �ý����� ���� �� Ʈ���Ű� 
							      ���ȴ�.
							      
2. ��Ű�� 
    - PL/SQL �ڵ带 ��ȣȭ �� �� ���

�� Ʈ������ ����
=> DML �� Ʈ����
  => before Ʈ����
  => after Ʈ����
  => instead of Ʈ����
=> DDL �� Ʈ����
=> DB �� �۾� (startup, shutdown) �� ���� Ʈ����
    
    
���� 1. ��� ���̺� ����ϰ� �Ͽ��Ͽ� ������ �����۾��� ���ϵ��� Ʈ���Ÿ� �����Ͻÿ� !
CREATE OR REPLACE TRIGGER secuer_emp
    BEFORE UPDATE ON emp
BEGIN
    IF ( TO_CHAR(SYSDATE, 'DY') IN ('��', '��', '��') ) THEN
    RAISE_APPLICATION_ERROR ( -20500, '����� �Ͽ��� ����Ͽ� ������ ������' );
    -- ���� ��ȣ�� 2������ ��ȣ�� �ƹ��ų� �ᵵ �ȴ�. 
    END IF;
END;
/

UPDATE emp
SET sal = sal * 2
WHERE ename = 'SCOTT';
=> ���� ���� ����!

���� 1. ����Ͽ� ��� ���̺��� delete �Ǵ� insert �� �� ������ �Ʒ��� ���� ��µǰ� Ʈ���Ÿ� 
�����Ͻÿ� !

CREATE OR REPLACE TRIGGER tg_242
    BEFORE delete or insert ON emp
BEGIN
    IF ( TO_CHAR(SYSDATE, 'DY') =('��') ) THEN
    RAISE_APPLICATION_ERROR ( -20500, '��� ���̺� �ƹ��� �۾��� ���� ������' );
    END IF;
END;
/

INSERT INTO emp (ename)
VALUES ('SCOTT');

DELETE FROM emp
WHERE ename = 'SCOTT';

- �ռ� ���� trigger�� ���� drop 
drop trigger tg_242;
drop trigger secuer_emp;

����2. ��� ���̺��� ������ 9000 �̻����� �������ϰ� �ϴ� Ʈ���Ÿ� �����Ͻÿ�.
create or replace trigger restrict_sal
    before update of sal on emp -- emp ���̺� ��ü�� �ƴ϶� Ư�� �÷��� ����
    for each row  -- Ư�� ������ �ุ ���� ���ϰ� �� �� �ִ�. 
begin 
    if (:new.sal >= 9000) then -- :new.sal -> ���ο� ������ ���� �̶�� �� 
        raise_application_error(-20500, '9000 �̻��� ������ ����.');
    end if;
end;
/

update  emp 
set sal = 9000
where ename = 'SCOTT';
=> ���� ���� ����. 

���� 3. ��� ���̺� �μ���ȣ�� 10��, 20��, 30�� �ܿ��� �ٸ� �μ���ȣ�δ� �������� ���ϰ� 
Ʈ���Ÿ� �����Ͻÿ�. 
create or replace trigger restrict_deptno
    before update of deptno on emp
    for each row
begin
    if (:new.deptno not in (10,20,30))then 
        raise_application_error(-20000,'10,20,30,�ܿ� �ٸ� �μ���ȣ�δ� ���� �Ұ�');
    end if;
end;
/

update emp 
set deptno = 70 
where ename = 'KING';

- trigger drop �ϱ� 
drop trigger restrict_deptno;