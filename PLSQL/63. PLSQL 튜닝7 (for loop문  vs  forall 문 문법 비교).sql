- for loop�� : �뷮�� �����͸� 1�Ǿ� ó���Ѵ�.
- forall �� : �뷮�� �����͸� �ѹ��� ó���Ѵ�.

for loop���� forall loop���� ���� ��
���� 1. ���� ���̺� ����
drop table test1 purge;
drop table test2 purge;

create table  test1 (c1 number);
create table  test2 (c1 number);

���� 2. for loop���� ����� ���ν��� ����
=> ���� ����� ���ν����� test1 ���̺� ���� 1���� 100000���� �Է��ϴ� ���ν���. 
create or replace procedure  for_pro
is
begin
    for i in 1 .. 100000 loop
    insert /*+ FOR */ into test1 -- insert ���� ã�� ���ؼ� 
    values (i);
    end loop;
end;
/
exec for_pro;

col sql_text for a20
SELECT sql_id, sql_text, executions, program_line#
FROM v$sql
WHERE sql_text LIKE 'INSERT /*+ FOR */%';
=> insert ������ �˻� -> 10���� �����Ѱ��� ���´�. 

���� 3. forall loop���� ����� ���ν��� ����
create or replace procedure  for_all_pro
is
    type tnt is table of pls_integer;
    l_v1 tnt := tnt (); -- �ʱ�ȭ 
begin
    for i in 1 .. 100000 loop
        l_v1.extend; -- extend�� �Ҷ����� �� �پ� �߰��ȴ�. 
        l_v1(i) := i; -- n ��° ��ҿ� n�� �־��. 
    end loop;
    
    forall i in l_v1.first .. l_v1.last
        insert /*+ FOR_ALL */ into test2
        values (l_v1(i));
end;
/
exec for_all_pro;

col sql_text for a20
SELECT sql_id, sql_text, executions, program_line#
FROM v$sql
WHERE sql_text LIKE 'INSERT /*+ FOR_ALL */%';
=> 1�� ������ ���� ���´�. 

=> �� ���ν����� ���� �ӵ� ���� Ȯ��
set timing on 

exec for_pro;
exec for_all_pro;
set timing off
=> forall�� �ξ� ������. 

(��������) 
1. test1 ���̺�� test2 ���̺��� �����͸� truncate �Ͻÿ�. 
truncate table test1;
truncate table test2;

2. �Ʒ��� select ������ sqlplus���� ���� ������ �ֵ��� script�� �����Ͻÿ�. 
col sql_text for a20
SELECT sql_id, sql_text, executions, program_line#
FROM v$sql
WHERE sql_text LIKE 'INSERT /*+ FOR */%';