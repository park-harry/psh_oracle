����� ���� �Լ��� �̿��Ͽ� ���̺� UPDATE �ϱ� ���� ����:
1. ���� demo.sql �� �����Ѵ�. 
@demo 

2. �μ���ȣ, �μ���ȣ�� ��Ż������ ����Ͻÿ�.
select deptno, sum(sal)
from emp
group  by deptno;

3. �̸��� ���ް� �μ���ȣ, �ڱⰡ ���� �μ���ȣ�� ��Ż������ ��µǰ��Ͻÿ� !
create or replace function fun51
(p_deptno emp.deptno%type) 
return number 
as 
    v_sum number(10);
begin
    select sum(sal) into v_sum 
    from emp 
    where deptno = p_deptno;
    
    return v_sum;
end;
/
SELECT ename, sal, deptno, fun51(deptno)
FROM emp;

4. �μ����̺� sumsal �÷��� ���������� �߰��Ͻÿ� !
alter table dept 
add sumsal number(10);

5. ��� �߰��� sumsal �÷��� �ش� �μ���ȣ�� ��Ż�������� ���� �����Ͻÿ� !
update dept 
set sumsal = fun51(deptno);
commit;

select * from dept;


���� 1.
1-1. �μ����̺� cnt ��� �÷��� �Ʒ��� ���� �߰��Ͻÿ�.
alter table dept 
add cnt number(10);

1-2. CNT �÷��� data �� �ش� �μ���ȣ�� �ο����� �����ϴ� �Լ��� �����Ͻÿ�
create or replace function pro_cnt
(p_deptno dept.deptno%type) 
return number 
as 
    v_cnt number(10);
begin 
    select count(deptno) into v_cnt 
    from emp 
    where deptno = p_deptno;
    
    return v_cnt;
end;
/

update dept 
set cnt = pro_cnt(deptno);
commit;

select * from dept;


���� 2. �Ʒ��� ���� �÷��� �߰��ϰ� �� �÷��� �ش� ����� �Ի��� ���Ϸ� ���� �����ϴ� ���ν����� 
�����ϴµ� ���ν����� ����� �� update �Ǵ� �� ���� ��µǰ� �Ͻÿ� !
alter table emp 
add hire_day varchar2(20);

create or replace procedure pro_day
(p_ename  emp.ename%type)
as 
    v_hireday emp.hire_day%type;
begin 
    update emp 
    set hire_day = to_char(hiredate,'day')
    where ename = p_ename
    returning hire_day into v_hireday;
    
    dbms_output.put_line(p_ename||'�� �Ի��� ������ '||v_hireday||'�� ���ŵǾ����ϴ�.');
end;
/

set serveroutput on 
exec  pro_day('SCOTT');

select ename, hire_day from emp;