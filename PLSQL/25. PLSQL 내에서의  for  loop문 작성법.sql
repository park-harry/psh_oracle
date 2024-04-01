- for loop ����
begin
		for ī���ͺ���  in  �ݺ��� ����  loop
		���๮;
		end  loop;
end;
/
=> 3���� loop�� �߿� �ڵ尡 ���� ������ �ݺ����̴�. (���� ���� ���) 

���� 1. for loop ���� �̿��ؼ� �Ʒ��� ������ 7�� �ݺ� ����ϼ���.
PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.

�������:
PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.
PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�. 

begin
		for   i    in    1 .. 7  loop
			dbms_output.put_line('PL/SQL �� ����Ͽ� DB������ �ڵ�ȭ �մϴ�.');
		end  loop;
end;
/

���� 2. 1~50 ������ ���ڸ� ����ϴµ� Ȧ���� ����Ͻÿ�. (for loop ���) 
begin 
    for i in 1..50 loop 
        if mod(i,2)=1 then 
            dbms_output.put_line(i);
        end if;
    end loop;
end;
/

���� 3. for loop ���� �̿��ؼ� ������ 7���� ����Ͻÿ�. 
begin 
    for i in 1..9 loop
        dbms_output.put_line('7 x '|| i||' = '|| 7*i);
    end loop;
end;
/

���� 4. �̸��� ����� �ϰ� �̸��� �Է��ϸ� �ش� ����� ������ 3000 �̻��̸� ��ҵ��� ��� �۾��� 
��µǰ� �ϰ� 3000 ���� ������ �Ϲ� �ҵ��ڶ�� ��µǰ� �Ͻÿ�. 
set serveroutput on 
set verify off 
accept p_ename prompt '�̸��� �Է��Ͻÿ�.'

declare 
    v_sal emp.sal%type;
    v_ename emp.ename%type := upper('&p_ename');
begin 
    select sal into v_sal
    from emp 
    where ename = v_ename;
    
    if v_sal >= 3000 then
        dbms_output.put_line('��ҵ���');
    else 
        dbms_output.put_line('�Ϲ� �ҵ���');
    end if;
end;
/



���� 5. ������ ���� ��Ż縦 ����� �ϰ� ��Ż縦 �Է��ϸ� �ش� ��Ż��� �л����� �̸�, ����, 
��Ż簡 ��µǰ� �Ͻÿ�. 
	��Ż縦 �Է��ϼ��� ~ sk 
	
set serveroutput on 
set verify off 
accept p_telecom prompt '��Ż縦 �Է��ϼ���: '
declare 
    cursor emp_cursor is 
    select ename, age, telecom 
    from emp18 
    where lower(telecom) = lower('&p_telecom');
begin 
    for emp18_record in emp_cursor loop
        dbms_output.put_line(emp18_record.ename||chr(9)||  
                              emp18_record.telecom);
    end loop;
end;
/

���� 6. ���� �ڵ带 ���ν����� ���� ����ǰ� �Ͻÿ�. 
	exec pro_telecom('sk')

set serveroutput on 
create or replace procedure pro_telecom
(p_telecom emp18.telecom%type)
is
    cursor emp_cursor is 
    select ename, age, telecom 
    from emp18 
    where lower(telecom) = lower('&p_telecom');
begin 
    for emp18_record in emp_cursor loop
        dbms_output.put_line(emp18_record.ename||chr(9)||
                             emp18_record.age||chr(9)||
                              emp18_record.telecom);
    end loop;
end;
/
exec pro_telecom('sk')


���� 7. ���̸� ������ϰ� ���̸� �Է��ϸ� �ش� �л����� �̸��� ���̿� ������ ��µǰ��Ͻÿ�.
���� ������ �л����� �̸��� ���̿� ������ ����� �� ������ ascending �ϰ� ����Ͻÿ�.

set serveroutput on 
set verify off 
accept p_age prompt '���̸� �Է��Ͻÿ�. '
declare 
    cursor emp18_cursor is 
    select ename, age, birth 
    from emp18 
    where age = &p_age
    order by birth;
begin 
    for emp18_record in emp18_cursor loop
        dbms_output.put_line(emp18_record.ename||chr(9)||
                             emp18_record.age||chr(9)||
                             emp18_record.birth);
    end loop;
end;
/