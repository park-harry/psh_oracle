�����͸� �����ϴ� �޸��� �ӽ� ���� ������ ������� �Ѵ�.

��Į��(scalar) ����
1. ������ ���� :  ���� �����͸� ��� ����
      ��:   v_ename      varchar2(20)
      
 2. ������ ���� :  ���� �����͸� ��� ����
    ��:  v_empno      number(10)
    
 3. ��¥�� ���� :  ��¥ �����͸� ��� ����
    ��:  v_hiredate    date
    
���ڸ� 4���� ����� �ϰ� 4���� ������ ���� ����Ͻÿ�. 

set  serveroutput  on 
set verify off 
accept   p_num1   prompt   'ù ��° ���ڸ� �Է��ϼ��� ~'
accept   p_num2  prompt    '�� ��° ���ڸ� �Է��ϼ��� ~'
accept   p_num3   prompt   '�� ��° ���ڸ� �Է��ϼ��� ~'
accept   p_num4   prompt   '�� ��° ���ڸ� �Է��ϼ��� ~'
-- �ܺ� ������ 

declare 
    v_sum       number(10);
-- declare�� end ���̿� �ִ� ������ ���� ����, �������� ��� �ܺ� ���� 
begin
    v_sum :=  &p_num1 +  &p_num2 + &p_num3 + &p_num4;
-- &�� �ٿ���� �ܺ� ������ ���ο��� �� �� �ִ�. 
    
    dbms_output.put_line('������ :  '  ||  v_sum );

end;
/