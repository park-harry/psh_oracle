- for loop ���� ������ ����:
begin
		for   ī���� �ε���  in   �ݺ��� ����  loop
				for   ī���� �ε���   in  �ݺ��� ����  loop
				���๮;
				end  loop;
		end  loop;
end;
/

���� 1. for  loop������ ������ 2���� ����Ͻÿ� !
begin
	for  i   in   1 .. 9  loop
			dbms_output.put_line( '2 x  ' ||  i  || ' = ' ||  2* i );
	end  loop;
end;
/

���� 2. for  loop������ ������ 2�ܰ� 3���� ����Ͻÿ�!
set serveroutput on 
begin 
    for i in 2..3 loop
        for j in 1..9 loop 
            dbms_output.put_line(i||'x'||j||'='||i*j);
        end loop;
    end loop;
end;
/

���� 3. ������ 2�ܺ��� 9�ܱ��� ��ü�� �� ����Ͻÿ� !
set serveroutput on 
begin 
    for i in 2..9 loop
        for j in 1..9 loop 
            dbms_output.put_line(i||'x'||j||'='||i*j);
        end loop;
    end loop;
end;
/