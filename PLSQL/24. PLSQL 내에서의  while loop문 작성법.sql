- while loop�� ����
begin
		while  ����  loop
			���๮;
			�ݺ����� ������ False �� ���� �ڵ�
		end  loop;
end;
/

=> while loop ���� �ݺ��� ������ �̸� �˰� �ִ� ��쿡 �ۼ��ϱ� ������ �ݺ����̴�.  
	 while �� loop ���̿� ������ True �� ���ȿ��� �ݺ����� ����ȴ�.

���� 1. while  loop ���� �̿��ؼ� �Ʒ��� ������ 7�� �ݺ� ����ϼ���.
PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.

	�������:
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
	PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.*/

declare
		v_cnt       number := 1 ;
begin
		while  v_cnt < 8  loop
				dbms_output.put_line( 'PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.' ) ;
				v_cnt :=   v_cnt +  1 ;
		end  loop;
end;
/	 

���� 2. 1~10 ������ �����߿� ¦���� ����Ͻÿ�.
set serveroutput on 
declare 
    v_cnt  number := 1;
begin 
    while v_cnt <= 10 loop
        if mod(v_cnt,2) =0 then 
            dbms_output.put_line(v_cnt);
        end if;
        v_cnt := v_cnt +1;
    end loop;
end;
/

���� 3. while loop �� �̿��Ͽ� ������ 8�ܿ��� Ȧ�� �κи� ����Ͻÿ� !
set serveroutput on 
declare 
    v_cnt number(10) := 1;
begin 
        while v_cnt <=9 loop
            if mod(v_cnt,2) =1 then 
                dbms_output.put_line('8 x '|| v_cnt||' = '|| 8*v_cnt);
            end if;
            v_cnt := v_cnt +1;
        
        end loop;
end;
/