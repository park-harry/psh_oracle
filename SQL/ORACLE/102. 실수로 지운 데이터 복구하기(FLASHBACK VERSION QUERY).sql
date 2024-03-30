���� 1-1. ���� �ð� Ȯ�� 
select systimestamp from dual;
23/12/13 16:18:26.805000000 +09:00

���� 1-2. KING�� ������ 9000���� �����Ͻÿ�. 
update emp 
set sal = 9000 
where ename = 'KING';
commit;

���� 1-3. KING�� �μ���ȣ�� 30������ �����Ͻÿ�. 
update emp 
set deptno = 30 
where ename = 'KING';
commit;

���� 1-4. KING�� ���� ����ÿ�. 
delete from emp 
where ename = 'KING';
commit;

���� 1-5. emp ���̺��� KING�� �����Ͱ� �׵��� ��� ������ �Ǿ�Դ��� �� �̷������� Ȯ���Ͻÿ�. 
select ename, sal, deptno, 
versions_starttime, versions_endtime, versions_operation
from emp 
versions between timestamp to_timestamp('23/12/13 16:18:26','RRRR/MM/DD hh24:mi:ss')
and maxvalue
where ename = 'KING';

���� 1-6. �ٽ� emp ���̺��� flashback table�� �ؼ� �����Ͻÿ�. 
alter table emp 
enable row movement;

flashback table emp 
to timestamp to_timestamp('23/12/13 16:18:26',
                            'RRRR/MM/DD HH24:MI;SS');