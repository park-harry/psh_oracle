���ε� ������ ȣ��Ʈ ȯ�濡�� ���� �� �־ ȣ��Ʈ ������� �ϴµ� ��Ÿ������ ������ �� �� 
�ִ� �Һ��� �����ϸ� �ȴ�. ȣ��Ʈ ȯ���� PL/SQL�� ���� ȯ���� ���Ѵ�.

1. �Ʒ��� �ڵ�� sqlplus ������Ʈ â���� �����Ͻÿ�. 
variable v_salary number 
=> ȣ��Ʈ ���� 

2.�Ʒ��� �ڵ�� notepad++ �� �ڵ��Ͻÿ�. 
begin
	select   sal  into   :v_salary => ���ε� ����, �տ� : �� ����� �Ѵ�. 
	from   emp
	where   empno = 7788;
end;
/

3. �Ʒ��� �ڵ�� sqlplus ������Ʈ â���� �����Ͻÿ�
print  v_salary
=>:(�ݷ�) �� begin�� end ���̿��� �ٿ��ش�. 

select  ename, sal
from  emp
where sal = :v_salary;
- ���ε庯��(ȣ��Ʈ ����)�� PL/SQL ���� SQL���� ����Ϸ��� �ݷ�(:) �� �տ� �ٿ���� �Ѵ�.
- ���ε� ���� �����  ���� ������  number �� ����ϰ� number(10) ���� �ϸ� ������ ����.
- ������ varchar2 �� varchar2(10) �� �ؾ� �ȴ�.


���� 1. �Ʒ��� �ڵ带 �����ϴµ� autoprint ����� �Ѱ� �����Ͻÿ�
1. �Ʒ��� �ڵ�� sqlplus ������Ʈ â���� �����Ͻÿ�
variable v_salary number
set autoprint on

�Ʒ��� �ڵ�� notepad++ �� �ڵ��Ͻÿ�.
declare
		v_empno    number(6) := &empno;
begin
		select   sal  into   :v_salary
		from   emp
		where   empno = v_empno;
end;
/

���� �ڵ带 Ȱ���ؼ� ������ ���� ����ǰ� �Ͻÿ�
	ename�� ���� �Է��ϼ��� ~   SCOTT
	ANALYST
	
variable v_job varchar2(10)
set autoprint on

declare 
	v_ename emp.ename%type := '&ename';
begin 
	select job into :v_job
	from emp 
	where ename = v_ename;
end;
/

=> autoprint ���� 
show autoprint 

set autoprint off 