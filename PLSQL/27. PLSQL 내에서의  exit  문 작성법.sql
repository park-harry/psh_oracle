exit ��
=> ���������� ����ϴ� �ɼ��̴�. �ݺ����� �ݺ��Ǵ� �߰��� ������ �� ����Ѵ�.

- exit  ����:
begin
		for   ī����   in   ����  loop
		  if  ���� then
		      exit  ;
		   end  if;
		      ���๮;
		 end  loop;
end;
/

���� 1. for  loop ���� �̿��ؼ� ���� 1������ 10������ ����Ͻÿ� !
begin
		for   i   in   1 .. 10   loop
				dbms_output.put_line(  i  );
		end  loop;
end;
/

���� 2. 1���� 10���� ��µǴ� �ݺ����� �����Ͻÿ�.���� 3���� ����ϰ� ���� 4 ������ �ݺ����� ���� 
��Ű�ÿ�.
begin
		for   i   in   1 .. 10   loop
				if  i = 4  then
						exit  ;
				end  if;
		dbms_output.put_line(i);
		end  loop;
end;
/

���� 3. �Ʒ��� ������ 2���� ����ϴ� PL/SQL������ 2 x 7 = 14 ������ ��µǰ� 2 x 8 = 16 ���ʹ� 
��µ��� �ʰ� exit ���� �߰��Ͻÿ�!
set serveroutout on 
begin 
    for i in 1..9 loop
        if i = 8 then 
            exit;
        end if;
        dbms_output.put_line('2 x ' || i || ' = ' || 2 * i );
    end loop;
end;
/