continue�� 
=> ���������� ����ϴ� �ɼ��̴�.
=> ���������� Ư�� ���๮�� �ݺ��� �� ��� ���ǿ� �ش��ϴ� �κ��� �������� �ʰ� �� �� �����ϴ�.
  - �� �ݺ����� �ʾƵ� �ǰ� �� �κ��� �׳� ���� ���� ���� �ٸ� �� �ݺ��ض� !
  - �����ϰ� �ٸ� �� �ݺ��ض�.

- continue ����:
begin
		for   ī����   in   ����  loop
		  if  ���� then
		         continue ; -- ���ǿ� �����ϸ� �����ϰ� ���๮�� �����϶�. 
		    end  if;
		        ���๮;
		end  loop;
end;
/

���� 1-1. for  loop ���� �̿��ؼ� ���� 1������ 10������ ����Ͻÿ� !
set serveroutput on 
begin
		for   i   in   1 .. 10   loop
				dbms_output.put_line(i);
		end  loop;
end;
/

���� 1-2. ������ ��µǴ� ����߿� ���� 4�� ��µ��� �ʰ� �Ͻÿ� !
set serveroutput on 
begin
		for   i   in   1 .. 10   loop
				if  i != 4  then
						dbms_output.put_line(i);
				end  if;
		end  loop;
end;
/

���� 1-3. ���� ����� continue �� �̿��ؼ� ����Ͻÿ� !
set serveroutput on 
begin
		for   i   in   1 .. 10   loop
				if  i = 4  then
				    continue ;
				end  if;
		    dbms_output.put_line(i);		
		end  loop;
end;
/

���� 2. 1 ~ 10������ �����߿��� ¦���� ����Ҷ� continue ���� �̿��ؼ� �����Ͻÿ�!
set serveroutput on 
begin 
    for i in 1..10 loop
        if mod(i,2)=1 then 
            continue;
        end if;
        dbms_output.put_line(i);
    end loop;
end;
/

���� 3. 1 ~ 50������ ���� �߿���  7�� ����� ����Ͻÿ�!
set serveroutput on 
begin 
    for i in 1..50 loop
        if mod(i,7) != 0 then 
            continue;
        end if;
        dbms_output.put_line(i);
    end loop;
end;
/