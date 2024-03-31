1. ù ��° ���� ����
declare
v_num    number(10)  not  null ;    <-- X
v_num    number(10)  not  null  :=  0 ;   <-- O
v_num2   constant   ;  <--- X, constant : ��� 
v_num2   constant  := 120 ;  <--- O
v_num3    varchar2(10)   default   'john' ;   <--- O


2. �� ��° ���� ����
select   ... into �� ������ ������ �ش� ���̺��� �÷������� ����� �� �ȴ�.

���� 1. �� ��° ���ǻ����� Ȯ���ϱ� ���ؼ� ������ �ڵ带 �����ϼ���.
set  serveroutput  on
accept   p_empno  prompt  '�����ȣ�� �Է��ϼ��� ~'
declare
		v_sal     number(10) ;
begin
		select   sal   into  v_sal
		from   emp
		where  empno = &p_empno;

		dbms_output.put_line('�ش� ����� ������ ' || v_sal );
end;
/

���� 2. ���� �ڵ��� v_sal  ��������  sal �̶�� �����ؼ� �����ϸ� ����Ǵ��� Ȯ���Ͻÿ� !
set  serveroutput  on
accept   p_empno  prompt  '�����ȣ�� �Է��ϼ��� ~'
declare
		sal     number(10) ;
begin
		select   sal   into  sal
		from   emp
		where  empno = &p_empno;

dbms_output.put_line('�ش� ����� ������ ' || sal );
end;
/ 

=> ������ ������ �ʴ´�. ������ ������ �鿡�� ũ�� �������� ������ �տ� v_ �Ǵ� p_ �� �� �ٿ���� 
	 �ȴ�. 

���� 1. ��� ��ȣ�� ����� �ϰ� �����ȣ�� �Է��ϸ� �ش� ����� ������ ��µǰ� �Ͻÿ�. 
set  serveroutput  on
accept   p_empno  prompt  '�����ȣ�� �Է��ϼ��� ~'
declare
		v_job     varchar2(10) ;
begin
		select   job   into  v_job
		from   emp
		where  empno = &p_empno;

		dbms_output.put_line('�ش� ����� ������ ' || v_job );
end;
/