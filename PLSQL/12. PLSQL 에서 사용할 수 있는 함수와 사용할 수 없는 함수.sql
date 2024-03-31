PL/SQL ���� ����� �� �ִ� �Լ� 
- ������ �Լ� ��κ� : ����, ����, ��¥, ��ȯ, �Ϲ�
    
PL/SQL ���� ����� �� ���� �Լ� 
- ������ �Լ� �߿���  decode �Լ�
- �׷��Լ� : max, min, avg, sum, count
    
    
���� 1. ���ڸ� �Է��ϰ� �ϰ� ������ ö���� ������ ����ϴ� PL/SQL��
set  serveroutput  on
		accept   p_str  prompt   '���ڿ��� �Է��Ͻÿ� ~  '

declare
		v_str       varchar2(100)  :=  '&p_str' ;
		v_result    number(20) ;

begin
		v_result := length(v_str);
		dbms_output.put_line( v_result ) ;
end;
/

���� 1. ���� �ڵ带 �����ؼ� �̸��� ������ϰ� �̸��� �Է��ϸ� �̸��� ������ ��µǰ��ϴ� PL/SQL
�ڵ带 �ۼ��Ͻÿ�.
	�̸��� �Է��ϼ��� ~   ȫ�浿
	ȫ

set  serveroutput  on
		accept    p_str   prompt   '�̸��� �Է��Ͻÿ� ~  '

declare
		v_str       varchar2(100)  :=  '&p_str' ;
		v_result    varchar2(20) ;

begin
		v_result := substr(v_str,1,1);
		dbms_output.put_line( v_result ) ;
end;
/

���� 2. ���ڸ� ������ϰ� ���ڸ� �Է��ؼ� ���� 1�� �Է��ϸ� true �� ��µǰ��ϰ� 0 �� �Է��ϸ� 
false �� ����ϰ� �Ͻÿ�. decode �Լ��� �̿��ؼ� �ۼ��Ͻÿ�.
	���ڸ� �Է��ϼ��� ~ 1
	true
	���ڸ� �Է��ϼ��� ~ 0
	false*/

set serveroutput on
		accept p_num prompt '���ڸ� �Է��Ͻÿ� ~ '

declare
	v_num   number(10) := &p_num;
	v_result  varchar2(10);

begin
		v_result := decode( v_num, 1, 'true', 0, 'false');
		dbms_output.put_line( v_result );
end;
/
=> pl/sql������ decode�� �� �� ���� ������ error �߻��Ѵ�. 

���� 3. SQL���忡 decode �� �Ἥ ���� ����� ����ǰ� �Ͻÿ� !
set serveroutput on
accept p_num prompt '���ڸ� �Է��Ͻÿ� ~ '

declare
		v_num   number(10) := &p_num;
		v_result  varchar2(10);

begin
		select decode(v_num,1,'true',0,'false') into v_result
		from dual;
		
		dbms_output.put_line( v_result );

end;
/