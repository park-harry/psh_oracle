�ݺ��� ��ü�� �ݺ� ��Ű�� ���� �� ���� �ݺ����� ����մϴ�.

- ����:
begin
		loop
				loop
						���๮;
						exit  when ���� �ݺ����� �����ų ����;
				end  loop;
				exit  when �ٱ��� �ݺ����� �����ų ����;
		end  loop;
end;
/

���� 1. basic loop������ ���� 1���� 9���� ����Ͻÿ�!
set serveroutput on 
declare 
		v_count number(10) := 1;
begin 
		loop 
				dbms_output.put_line(v_count);
				v_count := v_count +1;
				exit when v_count >9;
		end loop;
end;
/

���� 2. ������ 2���� ����ϴ� �⺻ basic loop���� �����Ͻÿ� !
set serveroutput on
declare
    v_count   number(10) := 1 ;
begin
    loop
        dbms_output.put_line( '2 x  ' || v_count || ' = ' || 2 * v_count );
        v_count  :=  v_count +  1 ;
        exit  when  v_count > 9;
    end  loop;
end;
/

���� 3. basic loop ������ ������ ��ü�� ����Ͻÿ�! (���� ���������� �ۼ�)
set serveroutput on
declare
    v_dan    number(10) := 2;
    v_count   number(10) := 1 ;
begin
    loop
        loop
            dbms_output.put_line(v_dan||'x'||v_count||'='||v_dan*v_count);
            v_count := v_count +1;
            exit when v_count > 9;
        end loop;
       v_dan := v_dan +1;
       v_count := 1; -- v_count�� �ٽ� 1�� �����ϴ� �ڵ� 
       exit when v_dan >9;
    end  loop;
end;
/

���� 4. ������ ��ü�� ����ϴ� �ڵ忡 �ڵ带 �߰��Ͽ� ������ ¦���ܸ� ��µǰ� �Ͻÿ�.
set serveroutput on
declare
    v_dan    number(10) := 2;
    v_count   number(10) := 1 ;
begin
        loop
            if mod(v_dan,2) = 0 then 
                loop
                    dbms_output.put_line(v_dan||'x'||v_count||'='||v_dan*v_count);
                    v_count := v_count +1;
                    exit when v_count > 9;
                end loop;
             end if;
               v_dan := v_dan +1;
               v_count := 1; 
               exit when v_dan >9;
        end  loop;
end;
/