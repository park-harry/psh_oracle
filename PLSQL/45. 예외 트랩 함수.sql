���� Ʈ�� �Լ�: PL/SQL ���α׷����� �߻��ϴ� ���� ��ȣ�� ���� �޼����� ��Ƴ��� �Լ�

����Ʈ�� �Լ��� ���� 2����
1. SQLCODE : PL/SQL���� �߻��ϴ� ���� ��ȣ�� Ʈ��(trap) �ϴ� �Լ�
2. SQLERRM : PL/SQL���� �߻��ϴ� ���� �޼����� Ʈ��(trap) �ϴ� �Լ�
    
ȯ�� ����. ������ ������ ��Ż������ ������ ���̺��� �����Ͻÿ�.
create   table   daily_machul
(  job       varchar2(10),
sumsal    number(10) );

���� 1. ��� ���̺��� ������ ������ ��Ż������ daily_machul �� �Է��ϴ� ���ν����� �����Ͻÿ�.
create or replace procedure daily_sum
is
begin
    insert into daily_machul
        select job, sum(sal)
        from  emp
        group by  job;       
    commit;
end;
/
exec  daily_sum;

���� 2. ���ν����� ���������� ������ ���ڱ� �����͸� �����Ѵ�.
update  emp
set  sal = 0
where  job='SALESMAN';

truncate  table   daily_machul;

alter   table  daily_machul
add   constraint   m_ck   check( sumsal  between  100  and   9000);

exec  daily_sum;

���� 1. ���ν����� �������� �� �߻��ϴ� ������ error ���̺� �Էµǰ� daily_sum ���ν����� 
�����Ѵ�.
create   table   error
(  e_date      timestamp,
e_code      number(10),
e_message     varchar2(200) );

create or replace procedure daily_sum
is
    e_code    number;
    e_message     varchar2(200);

begin
    insert   into    daily_machul
        select  job,  sum(sal)
        from  emp
        group by  job;
       commit;
       
       exception
        when   others     then -- others �� ��� ������ ��Ƴ���. 
        rollback;
        e_code := SQLCODE;
        e_message := SQLERRM;
        insert    into   error   values 
            ( systimestamp,  e_code, e_message );
end;
/

exec daily_sum;

���� 2. ���� ���ν����� ���������� �߻��ϴ� ���� �ڵ�� ���� �޼����� error ���̺� �Էµʰ�
���ÿ� ��µ� �ǰ� ���ν����� �����ϼ���
create or replace procedure daily_sum
is
    e_code    number;
    e_message     varchar2(200);

begin
    insert   into    daily_machul
        select  job,  sum(sal)
        from  emp
        group by  job;
       commit;
       
    exception
        when   others     then  -> others �� ��� ������ ��Ƴ���. 
        rollback;
        e_code := SQLCODE;
        e_message := SQLERRM;
        insert    into   error   values 
            ( systimestamp,  e_code, e_message );
        dbms_output.put_line('���� �޼�����: '||e_code||
                            '���� ��ȣ:'||e_message);
end;
/

exec daily_sum;