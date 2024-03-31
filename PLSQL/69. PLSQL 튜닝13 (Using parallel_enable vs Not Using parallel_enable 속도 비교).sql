- �ϳ��� ���� ȥ�ڼ� �ϴ°� �ƴ϶� ���� ���μ������� ������ ���� ���ÿ� �۾��ϴ� ���� ���� �۾�
	�̶�� �Ѵ�. �׷��� PL/SQL �Լ��� ������ �� parallel_enabled �ɼ��� ����ϰ� �Ǹ� �Լ��� 
	������ �� ���ķ� �۾��� �ؼ� ������ ���� �� �ִ�.
	
- ���� ���� ó���� ������ �Ƿ��� ����Ŭ ���α׷��� � ���� Ȯ���ؾ� �Ѵ�.
  => express edition�� ������ ���� �ʴ´�. �Ʒ��� �ڵ�� edition Ȯ��
		
		select * from  v$version;

�ǽ�.
- �Լ�(�̱�ó��) -> �̱� ó���� �� �Լ��� �����ϴ� ���μ����� 1����� ���̴�. 
create or replace function func_s
(p_val number)
return number
is
    v_ret number;
begin
    select dbms_random.value(1, p_val) into v_ret
    from dual;
    
    return v_ret;
end;
/

- �Լ� (����ó��)
create or replace function func_p
(p_val number)
return number
parallel_enable
is
    v_ret number;
begin
    select dbms_random.value(1, p_val) into v_ret
    from dual;
    
    return v_ret;
end;
/

- �׽�Ʈ ���̺� ���� 
drop  table test1;

create table  test1
as
select empno, salary, deptno,
    lpad(ename, 5, ename) as ename,
    lpad(addr, 5, addr) as addr
    from ( select level + 10000000 as empno,
        mod(level,1000) + 10000 as salary,
        mod(level,20) as deptno,
        chr(97+mod(level,26)) as ename,
        chr(65+mod(level,26)) as addr
        from dual
        connect by level <= 2000000
        );

set timing on

select /*+ parallel(10) */ avg(hash_val)
from (select func_s(empno) as hash_val
    from TEST1
    );
=> parallel(10)�� �ָ� �����۾��� ������ func_s�� �̱�ó���� ����ó���� ���� �ʴ´�. 

select /*+ parallel(10) */ avg(hash_val)
from (
select func_p(empno) as hash_val
from TEST1
);

show parameter cpu_count 
=> cpu_count ������ ������ 2�踸ŭ ������ �� �� �ִ�. 

���� 1. �Ʒ��� func179 �Լ��� ���ķ� ������ �� �ֵ��� �ɼ��� �ְ� ���ķ� �����Ͻÿ�. 
CREATE OR REPLACE FUNCTION fun179
( p_ename emp.ename%TYPE )
RETURN VARCHAR2
parallel_enable
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

SELECT /*+ parallel(10) */ ename, sal, fun179(ename) �ҵ�
FROM emp
WHERE fun179(ename) = '��ҵ�';

���� 2. ���� sql�� �ٽ� �����ϴµ� ���ĵ��� 16�� �ְ� �����Ͻÿ�. 
SELECT /*+ parallel(16) */ ename, sal, fun179(ename) �ҵ�
FROM emp
WHERE fun179(ename) = '��ҵ�';