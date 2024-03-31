 select .. into ���� ����� ���� 1���� �ุ �����ؾ� �Ѵ�. ������ ���� �������� ���� 
 �����Ϸ� �ϸ� ������ �߻��Ѵ�.

set  serveroutput   on
declare
		v_ename     varchar2(25);
begin
		select  ename   into   v_ename
		from   emp
		where   job='SALESMAN';

		dbms_output.put_line( v_ename );
end;
/

=> ������ SALESMAN�� ������� �̸��� ��������. v_ename�� ��Į�� �����ε� ��Į�� ������ 
���� 1���� ���� �� �ִ�. �׷��Ƿ� ���� �ڵ�� ������ �߻��Ѵ�. 
���� ���� ���� ������ ���� select .. into�� ����ϸ� �� �ǰ� �ڿ��� ��� bulk ... into�� 
����ϸ� �����ϴ�. 

ORA-01422: ���� ������ �䱸�� �ͺ��� ���� ���� ���� �����մϴ�

���� 1. �μ���ȣ�� ����� �ϰ� �μ���ȣ�� �Է��ϸ� �ش� �μ���ȣ�� ��Ż������ ��µǰ��Ͻÿ� !
set serveroutput on 
accept   p_deptno   prompt   '�μ���ȣ�� �Է��ϼ��� ~ '

declare 
		v_deptno emp.deptno%type := &p_deptno;
		v_sumsal  number(10,2);
begin 
		select sum(sal) into v_sumsal
		from emp 
		where deptno = v_deptno;
		dbms_output.put_line ( '��Ż������ : '  ||  v_sumsal  );
end;
/

group �Լ��� Ư¡
=> null ���� �����մϴ�.
=> where ���� ������ �����̾ ����� return �Ѵ�.
  => ��: max, sum,avg,min �� null ���� return �Ѵ�.
	   count �� 0�� return �Ѵ�. ���õ� ���ڵ尡 ���ٰ� ��� ���� �ʴ´�.
	   
���� 2. ������ ����� �ϰ� ������ �Է��ϸ� �ش� ������ ��Ż������ ��µǰ� �ϴ� PL/SQL �� 
�ۼ��Ͻÿ�!
		������ �Է��ϼ��� !   SALESMAN
		��Ż������  5600  �Դϴ�. 

set serveroutput on 
accept p_job prompt '������ �Է��ϼ���!'

declare 
	v_job  emp.job%type := '&p_job';
	v_sumsal	number(10,2);
begin 
	select  sum(sal) into v_sumsal
	from emp 
	where job = v_job;
	
	dbms_output.put_line('��Ż ������: ' || v_sumsal);
end;
/

-> job�� ���� ����Ϸ��� group by ���� ���! 
set serveroutput on 
accept p_job prompt '������ �Է��ϼ���!'

declare 
	v_job  emp.job%type := '&p_job';
	v_sumsal	number(10,2);
begin 
	select  job, sum(sal) into v_job,v_sumsal
	from emp 
	where job = v_job
	group by job;
	
	dbms_output.put_line(v_job||'�� ��Ż ������: ' || v_sumsal);
end;
/

���� 3. ���� �ڵ带 �����ؼ� ������ �ҹ��ڷ� �Է��ص� ����� �� ��µ� �� �ְ� �Ͻÿ�. 
- ��� 1
set serveroutput on 
accept p_job prompt '������ �Է��ϼ���!'

declare 
	v_job  emp.job%type := '&p_job';
	v_sumsal	number(10,2);
begin 
	select  job, sum(sal) into v_job,v_sumsal
	from emp 
	where job = upper (v_job)
	group by job;
	
	dbms_output.put_line(v_job||'�� ��Ż ������: ' || v_sumsal);
end;
/

- ��� 2 -> �� ���� ��� (v_job�� ������ ���� ���� �ֱ� ������) 
set serveroutput on 
accept p_job prompt '������ �Է��ϼ���!'

declare 
	v_job  emp.job%type := upper('&p_job');
	v_sumsal	number(10,2);
begin 
	select  job, sum(sal) into v_job,v_sumsal
	from emp 
	where job = v_job
	group by job;
	
	dbms_output.put_line(v_job||'�� ��Ż ������: ' || v_sumsal);
end;
/