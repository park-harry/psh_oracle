1. ���� �̸��� �ݵ�� ���ڷ� �����ؾ� �Ѵ�.
2. ���� �̸��� ���ڳ� ���ڸ� ������ �� �ִ�.
3. Ư�����ڴ� #, $, _ �� �� �� �ִ�.
4. 30�� �̳��� �ۼ��ؾ� �Ѵ�.
5. ����Ŭ ���� �� �� ����.

���� 1. ����Ŭ ���� ���������� ����ϸ� ������ ������ �׽�Ʈ �ϼ���
set  serveroutput  on
accept   p_num1   prompt   'ù��° ���ڸ� �Է��ϼ��� ~'
accept   p_num2  prompt    '�ι�° ���ڸ� �Է��ϼ��� ~'

declare
		select       number(10);
begin
		select :=  &p_num1 +  &p_num2 ;
		dbms_output.put_line('������ :  '  ||  select );
end;
/
=> ���� ����. ����Ŭ ���� ���������� �� �� ����. 

���� 2. �Ʒ��� �ڵ忡�� �������� select ��ſ� from �̶�� �ϸ� ������ ������ Ȯ���Ͻÿ�. 
set  serveroutput  on
accept   p_num1   prompt   'ù��° ���ڸ� �Է��ϼ��� ~'

accept   p_num2  prompt    '�ι�° ���ڸ� �Է��ϼ��� ~'

declare
		from       number(10);
begin
		from :=  &p_num1 +  &p_num2 ;
		dbms_output.put_line('������ :  '  ||  from );
end;
/
=> ���� ����. ����Ŭ ���� ���������� �� �� ����. 