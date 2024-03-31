�� SQL trace�����ϱ�
1. �ð� ������ SQL trace�� ���Ե� �� �ֵ��� ����
alter session set timed_statistics = true;

2. �����Ǵ� trace file�� ������ ���� �ʰ� ����
alter session set max_dump_file_size = unlimited;

3. 10046 Ʈ���̽� �̺�Ʈ�� Ȱ��ȭ �Ѵ�.(����Ŭ 7.3 �̻�)
alter session set events '10046 trace name context forever, level 12';

=> level �� 12���� �ټ� �ִ�.  8���ٴ� �� ���� ������ ��µȴ�.

4. Ʃ���� �ʿ��� SQL�� �����մϴ�.
select /*+ full(emp) */  ename, sal
from  emp
where  ename='SCOTT';

select empno, ename, sal, job 
from emp 
where job = 'SALESMAN';

select ename,  job, mgr
from emp 
where deptno= 10;

5. Ʈ���̽��� �ߴ��Ѵ�
alter session set events '10046 trace name context off';


6. user trace file �����Ǵ� ��ġ �����ϱ� (���� 2���� 3�� ����) 
6-1. sys ������ �����ؼ� ��ġ Ȯ���Ѵ�. 
sqlplus sys/oracle_4U as sysdba
    
show parameter user_dump_dest
    
6-2. user_dump_dest�� ��ġ�� �ٸ� ��ġ�� �����Ѵ� 
alter system set user_dump_dest ='D:\oracle2\diag\rdbms\xe\xe\trace' scope=spfile; 

=> ���ϸ��� ��ǻ�͸��� �ٸ���

startup force

6-3. ��ġ Ȯ�� 
show parameter user_dump_dest

D:\oracle2\diag\rdbms\xe\xe\trace
- ������ Ž���⸦ ���� ���� ��ġ�� �̵��Ѵ�.
- ��¥������ �����ϰ� �� �������� ������ trace file ����
- ���� �̸� ���� �� xe_dia0_11688.trc
- ����̺꿡 trace ���� ���� ����� ���� ���� �����ϱ�
- ��� ������Ʈ â���� ��cd ..�� �� ������ C �Ǵ� D ����̺���� ����.
- dir �� cd trace

7. ���� Ʈ���̽� ������ ���⽱�� ���� ���
(os)
tkprof explain=c##scott/tiger  sys=no
trace =xe_dia0_11688.trc
result= result01.txt

���� 1. ���Ͱ��� SQL trace �� �ߴ°��� ������ ���� ������ �� �ֵ��� ��ũ��Ʈ�� �̿��ؼ� �����Ͻÿ�. 
(user trace file zip �ٿ� �ޱ�)

trace_on.sql
trace_off.sql
trace_file.sql
- ù ��° �ٿ� / �� \ �� �ٲ��ش�.
tkprof.sql
�� 4���� ������ trace ������ �ű��. 

- ��� ������Ʈ â���� trace ������ ���� ��ũ��Ʈ�� �����Ѵ�.

�������:
@trace_on.sql

select /*+ full(emp) */  ename, sal
from  emp
where  sal = 3000;

@trace_off.sql
@trace_file.sql
@tkprof
�� D:\ORACLE2\DIAG\RDBMS\XE\XE\TRACE\xe_ora_6504.trc
�� result�� �ƹ��ų� �ᵵ �ȴ�. (�ڿ� .txt ���� ���� �̸� ���̱�)

����2.  �Ʒ��� SQL�� SQL trace �� �����Ͻÿ� ! ����Ʈ �̸��� report07.txt
��  �ϼ��� !
select /*+ index(emp emp_sal) */  ename, sal
from  emp
where  sal = 3000;

��: 
@trace_on.sql

select /*+ index(emp emp_sal) */  ename, sal
from  emp
where  sal = 3000;

@trace_off.sql
@trace_file.sql
@tkprof
�� D:\ORACLE2\DIAG\RDBMS\XE\XE\TRACE\xe_ora_6504.trc
�� result07.txt