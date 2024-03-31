SQL ������ �Ͻ��� �� ��ȯ 1
select   ename, sal
from  emp
where  sal = '3000';

=> �Ͻ������� '3000'�� ���������� ��ȯ�Ѵ�. 

SQL ������ �Ͻ��� �� ��ȯ 2 
select   ename, hiredate
from  emp
where  hiredate =  '82-12-22';

=> �Ͻ������� �������� ��¥������ ��ȯ�Ѵ�. 

select ename, hiredate
from  emp
where  hiredate = to_date('22-12-82','DD-MM-RR');

�� ���� ���� ������ ������ ��¥����, ���, ȭ�� ���� Ȯ���ϱ�
select * from nls_session_parameters;

�ǽ� 1. �Ͻ��� �� ��ȯ�� PL/SQL ���� �Ͼ�� ��츦 �׽�Ʈ �Ͻÿ�.
set  serveroutput  on
declare
	v_sal      emp.sal%type  := 0  ;
	v_hiredate    emp.hiredate%type :=  '82/12/22' ;

begin
	dbms_output.put_line( v_sal );
	dbms_output.put_line( v_hiredate );
end;
/

=> �Ͻ��� �� ��ȯ�� �Ͼ�� ���� ���� �� ����ȴ�. 

�ǽ� 2. �Ͻ��� ����ȯ�� ������ �� �ֵ��� ��¥ ������ ����� ��¥ �������� �����ؼ� �����Ͻÿ�.
set  serveroutput  on
declare
	v_sal      emp.sal%type  := 0  ;
	v_hiredate    emp.hiredate%type :=  '22/12/82' ;

begin
	dbms_output.put_line( v_sal );
	dbms_output.put_line( v_hiredate );
end;
/

���� 1. ����� ����ȯ �Լ� to_date �� ����Ͽ�  '22/12/82' �� �״�� ����ϴ��� ������ ���� �ʵ���
�ڵ带  �����Ͻÿ�!

set  serveroutput  on
declare
v_sal      emp.sal%type  := 0  ;
v_hiredate    emp.hiredate%type := to_date('22/12/82','DD/MM/RRRR')  ;

begin
dbms_output.put_line( v_sal );
dbms_output.put_line( v_hiredate );
end;
/