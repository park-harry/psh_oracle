���� ���������� ���̺��� ����ϰ� �Ǹ� ��� �ڵ������ ���� �������̰� ��� �ڵ������ ���� ������ ������ ��Ȯ�� ������ �� �ִ�.

���� 1. ������ ��ü�� ����ϴ� basic loop������ ���̺��� ����Ͻÿ�
declare
    v_dan      number(10) := 2;
    v_count   number(10) := 1 ;
begin
    <<Outer_loop>>
        loop
            <<Inner_loop>>
                loop
                    dbms_output.put_line( v_dan||'x'|| v_count||'='||v_dan * v_count );
                    v_count  :=  v_count +  1 ;
                    exit  Inner_loop when  v_count > 9;
                end  loop  Inner_loop;
            v_dan := v_dan + 1;  -
            v_count := 1;           
            exit Outer_loop when  v_dan > 9;   -> ���� �������� �����Ű�� �ڵ�
        end loop Outer_loop;
end;
/

���� 2. ������ ���� for loop���� ���̺��� �߰��ϼ���.
begin
    <<outer_loop>>
    for   i  in   2 .. 9  loop
        <<inner_loop>>
        for   j   in  1 .. 9  loop
            dbms_output.put_line( i  || ' x ' ||  j  ||  ' = ' ||  i * j );
        end loop inner_loop;
    end loop outer_loop;
end;
/