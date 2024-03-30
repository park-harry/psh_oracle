1. DB�� ���� �����Ѵ�. 
sqlplus sys/oracle_4U as sysdba

shutdown immediate

2. DB�� ����Ʈ(mount) ���·� �ø���. 
startup mount 

3. ��ī�̺� ���� ��ȯ�ϴ�.(���߿� ������ ������ �� �ֵ��� �α׸� �ڵ����� ����ϰ� �����ϱ�) 
alter database archivelog;

4. DML ���� ��ϵ� �� �ֵ��� �����Ѵ�. 
alter database add supplemental log data;

5. DB�� open ��Ų��.
alter database open;

6. ������ �� �Ǿ����� Ȯ���Ѵ�. 
archive log list;

7. c##scott ������ �����ؼ� KING�� ���ް� �μ���ȣ�� ��ȸ�Ѵ�. 
connect c##scott/tiger
select ename, sal, deptno 
from emp 
where ename = 'KING';

8. KING�� �μ���ȣ�� 20��ȣ�� �����Ѵ�. 
update emp 
set deptno = 20 
where ename = 'KING';

9. KING�� ������ 800���� �����Ѵ�. 
update emp 
set sal= 8000
where ename = 'KING';

10. flashback version query �� �̿��ؼ� KING�� �����Ͱ� ��� ����Ǿ� �Դ��� �� �̷� ������ 
Ȯ���Ͻÿ�. 
select versions_startscn, versions_endscn, versions_operation, sal, deptno
from emp
versions between scn minvalue and maxvalue
where ename = 'KING';

11. flashback transaction query �� �̿��ؼ� KING�� �����͸� ���ŷ� �ǵ����� ���� DML ������ 
����Ͻÿ�. 
select undo_sql
from flashback_transaction_query
where table_owner='C##SCOTT' and table_name = 'EMP'
and commit_scn between 21500538 and 21500622
order by start_timestamp desc;

���� 1-1. ALLEN�� Ŀ�̼��� 7000���� �����ϰ� ������ president�� �����Ͻÿ�. 
update emp set comm = 7000
where ename = 'ALLEN';

update emp
set job = 'PRESIDENT'
WHERE ENAME = 'ALLEN';

commit;

���� 1-2. ALLEN �� �����Ͱ� �׵��� ��� ����Ǿ� �Դ��� flashback version query �� �̷�������
Ȯ���ϰ� flashback transaction query�� ���� dml ������ �����Ͻÿ�. 
select versions_startscn, versions_endscn, versions_operation, comm,job
from emp
versions between scn minvalue and maxvalue
where ename = 'ALLEN';

select undo_sql
from flashback_transaction_query
where table_owner='C##SCOTT' and table_name = 'EMP'
and commit_scn between 21503285 and 21503285
order by start_timestamp desc;

���࿡ scn �� �� �� ���ٸ�, �ð����� scn ��ȣ�� �˾Ƴ� �� �ִ�.
1. ���� �ð��� Ȯ���Ѵ�. 
select systimestamp from dual; 

2. �ð����� scn ��ȣ�� ã�´�. 
select timestamp_to_scn('23/12/14 10:48:08')
from dual;

3. scn ��ȣ�� �ð��� ã�� ���� �ִ�. 
select scn_to_timestamp('21506708')
from dual;