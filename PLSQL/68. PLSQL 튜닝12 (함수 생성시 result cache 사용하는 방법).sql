RESULT CACHE �� SQL�� PL/SQL�� ���� ������ ���� ����Ŭ�� ����� �ϳ���. RESULT CACHE�� ����Ŭ 
�޸��� RESULT CACHE MEMORY �� �Ҹ��� ������ SQL �� PL/SQL �Լ��� ����� �����ϰ�, ���� ���� 
QUERY ��ȸ �� RESULT CACHE �� ���� �Ǿ� �ִ� QUERY ��� ���� �״�� Ȱ���ϴ� ����̴�.

sqlplus���� ����
�ǽ� 1. result cache ��� �� ���� ��
sqlplus c##scott/tiger
grant execute on dbms_lock to c##scott;

connect c##scott/tiger

create or replace function test_result_cache
( p_in in number )
return number
as
    begin
    dbms_lock.sleep(10);
    return( p_in );
end;
/

set timing on
select test_result_cache(7) from dual;

�ǽ� 2. result cache ��� ���� ��
create or replace function test_result_cache
( p_in in number )
return number
result_cache
as
    begin
    dbms_lock.sleep(10);
    return( p_in );
end;
/

select test_result_cache(7) from dual;
-- ó������ 10�ʰ� �ɸ����� �ι�°���ʹ� ����� �ٷ� ���´�. (�޸𸮿� �̹� ������ �� �ֱ� ������)
select test_result_cache(7) from dual;

���� 1. ������ �Լ��� result cache �� ����ؼ� ������ ���������� �Ͻÿ� !
CREATE OR REPLACE FUNCTION fun179
( p_ename emp.ename%TYPE )
RETURN VARCHAR2
result_cache
AS
    v_rank  NUMBER(5);
    v_msg   VARCHAR2(20);

BEGIN
    dbms_lock.sleep(1);    
    SELECT ���� INTO v_rank
      FROM ( SELECT ename, DENSE_RANK() OVER ( ORDER BY sal DESC ) ����
              FROM emp)
      WHERE ename = UPPER(p_ename);
    IF v_rank < 4 THEN
        v_msg := '��ҵ�';    
    ELSE 
        v_msg := '���ҵ�';   
    END IF;
    RETURN v_msg;
END;
/

SELECT ename, sal, fun179(ename) �ҵ�
FROM emp
WHERE fun179(ename) = '��ҵ�';

=> 1��° ����: 14�� 
=> 2��° ���� : 1�� 