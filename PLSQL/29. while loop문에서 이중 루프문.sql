�ݺ��� ��ü�� �ݺ� ��Ű�� ���� �� ���� �ݺ����� ����Ѵ�.
- while loop ����
begin
		while  ����  loop
				while  ����  loop
				
				���๮ ;
				end  loop;
		end  loop;
end;
/

���� 1. ������ 2���� while loop ������ �����Ͻÿ� !
declare
		v_count     number(10) := 1;
begin
		while   v_count < 10  loop
				dbms_output.put_line( '2 x '  || v_count ||  ' = ' || 2 * v_count );
				v_count  :=  v_count +  1 ;
		end  loop;
end;
/

���� 2. ������ ��ü�� while loop������ ����Ͻÿ� !
set serveroutput on
declare
    v_dan    number(10) := 2;
    v_count   number(10) := 1 ;
begin
    while v_dan < 10 loop
           while v_count < 10 loop
                dbms_output.put_line(v_dan||'x'||v_count||'='||v_dan*v_count);
                v_count:= v_count +1;
           end loop;
       v_count := 1;
       v_dan := v_dan +1;
    end loop; 
end;
/

���� 3. �������� ¦���ܸ� ��µǰ� �Ͻÿ� !
set serveroutput on
declare
    v_dan    number(10) := 2;
    v_count   number(10) := 1 ;
begin
    while v_dan < 10 loop
        if mod(v_dan,2)=0 then 
           while v_count < 10 loop
                dbms_output.put_line(v_dan||'x'||v_count||'='||v_dan*v_count);
                v_count:= v_count +1;
           end loop;
        end if;
       v_count := 1;
       v_dan := v_dan +1;
    end loop; 
end;
/