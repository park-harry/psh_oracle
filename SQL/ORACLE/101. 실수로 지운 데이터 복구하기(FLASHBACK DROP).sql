�� ������ �ӿ� �ִ� ���̺��� �����ϴ� ��ɾ� 
���� 1. ������ ���� 
purge recyclebin;

���� 1-1. ��� ���̺� ���޿� �ε����� �����Ͻÿ�. 
create index emp_sal 
on emp(sal);

���� 1-2. emp ���̺��� drop �Ͻÿ�. 
drop table emp;

���� 1-3. �������� Ȯ���Ѵ�. 
show recyclebin;

���� 1-4. �����뿡�� emp ���̺��� �����Ѵ�. 
flashback table emp to before drop;

���� 1-5. ���̺� �̸� Ȯ���ϴ� ��� 
select table_name 
from user_tables;

���� 1-6. emp�� drop �ϰ� flashback���� �츰 �Ŀ� emp_sal index�� �ٽ� ��Ƴ����� Ȯ���Ͻÿ�. 
select index_name 
from user_indexes
where table_name = 'EMP';

���� 1-7. BIN$RL5iBzqrRKeHKP6exvkjmQ==$1 �� emp_sal�� �����Ͻÿ�. 
alter index "BIN$RL5iBzqrRKeHKP6exvkjmQ==$1" rename to emp_sal;