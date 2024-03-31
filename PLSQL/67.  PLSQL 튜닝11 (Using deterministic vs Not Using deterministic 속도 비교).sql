- deterministic �� '��������' �̶�� �ѱ� ���̴�. � �Է��� ���͵� ������ �Ȱ��� ������ 
	���ļ� �Ȱ��� ����� �����´ٸ� �ԷµǴ� ���� ����� �̹� �����Ǿ� �ִٴ� ���̴�.
- PL/SQL ����� ���� �Լ��� ������ ���̱� ���ؼ� deterministic ���� ����� �� �ִµ�,
  deterministic ���� �Լ����� ����ϸ� �Լ��� �ݺ������� ȣ���ϴ� ��� ������ ���� ����� 
  ����ϵ��� �� �� �ִ�.
  
  
�ǽ� 1.� ���� �Է¹޾Ƽ� �� ���� ���ڸ� Y�� �����ϰ� ���ڰ� �ƴϸ� N�� �����ϴ� �Լ��� 
�����Ͻÿ�.
create or replace function is_number
    (p_value in varchar2)
    return char
is
    p_num number(10);
begin
    p_num := to_number(p_value);
    return 'Y';
    exception
	    when value_error then
	    return 'N';
end;
/

�ǽ� 2. 
alter  table  emp
add  mgr2   varchar2(10);

update  emp
set  mgr2 = mgr;

select  ename, mgr, mgr2 from emp;

update emp
set  mgr2='A999'
where ename='KING';

commit;

�ǽ� 3. �Լ��� ����Ͽ� emp ���̺��� �����͸� select �Ѵ�.
col isnumber for a10 
select empno, ename, mgr2, is_number(mgr2) as isnumber
from  emp;

=> column�� ���̸� a10���� ���� 
=> deterministic ���� �̿��ؼ� �����ϸ� 7839 �� ���� �ݺ��Ǵ� ��ȣ�� �Լ��� �������� �ʰ� �ٷ� 
	������� ����� �� �ִ�. (�Լ��� �������� �ʰ� ����� ����ϱ� ������ �ӵ��� �� ������.)
    
�ǽ�4. deterministic �� ���� �Լ��� ������ ���� �����Ѵ�. 
set serveroutput on 
create or replace function is_number
    (p_value in varchar2)
    return char
    is
        p_num number;
begin
    dbms_output.put_line('is_number ('||p_value||') called');
    p_num := to_number(p_value);
    return 'Y';
    exception
        when value_error then
        return 'N';
end;
/

�ǽ� 5. �Լ��� ����Ͽ� emp ���̺��� �����͸� select �Ѵ�
select empno, ename,  mgr2, is_number(mgr2) as isnumber
from  emp;

�ǽ�6. deterministic �ɼ��� �ְ� �Լ��� �����Ѵ�.
set serveroutput on 
create or replace function is_number
    (p_value in varchar2)
    return char
    deterministic
    is
        p_num number;
begin
    dbms_output.put_line('is_number ('||p_value||') called');
    p_num := to_number(p_value);
    return 'Y';
    exception
        when value_error then
        return 'N';
end;
/

select empno, ename, mgr2, is_number(mgr2) as isnumber
from  emp;

�ǽ� 7. �Լ��� ����Ͽ� emp ���̺��� �����͸� select �Ѵ�
set serveroutput on
select empno, ename,  mgr2, is_number(mgr2) as isnumber
from  emp;

���� 1. �μ���ȣ�� �Է��ϸ� �ش� �μ���ȣ�� ��Ż������ ��µǴ� fun51 �Լ��� deterministic 
�ɼ��� �ְ� �Լ��� ���� �ϰ� �۵��Ǵ��� �׽�Ʈ �Ͻÿ� !
CREATE OR REPLACE FUNCTION fun51
( p_deptno emp.deptno%TYPE )
RETURN NUMBER
deterministic
AS
v_sum NUMBER(10);

BEGIN
    dbms_output.put_line('is_number ('||p_deptno||') called');
    SELECT SUM(sal) INTO v_sum
    FROM emp
    WHERE deptno = p_deptno;
    
    RETURN v_sum;
END;
/

CREATE OR REPLACE FUNCTION fun51
( p_deptno emp.deptno%TYPE )
RETURN NUMBER
deterministic
AS
v_sum NUMBER(10);

BEGIN
    dbms_output.put_line('is_number ('||p_deptno||') called');
    SELECT SUM(sal) INTO v_sum
    FROM emp
    WHERE deptno = p_deptno;
    
    RETURN v_sum;
END;
/

select ename, sal deptno, fun51(deptno)
from emp;

���� 2. emp ���̺��� ������ �Է��ϸ� �ش� ������ ��Ż ������ ��µǴ� �Լ��� fun_job���� 
�����ϴµ� �ѹ� ȣ��� �����ʹ� �ٽ� ������� �ʰ� �Լ��� �����ϰ� ����Ͻÿ�. 
create or replace function fun_job 
(p_job emp.job%type)
return number
deterministic 
as 
    v_sumsal number(10);
begin
    dbms_output.put_line('job ('||p_job||') called');
    select sum(sal) into v_sumsal 
    from emp 
    where job = p_job;
    
    return v_sumsal;
end;
/

select job, fun_job(job) 
from emp;