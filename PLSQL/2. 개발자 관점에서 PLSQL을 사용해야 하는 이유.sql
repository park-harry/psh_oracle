�μ���ȣ�� �μ���ȣ�� ��Ż������ ����ϴµ� ���η� ����Ͻÿ�.
sum�� decode �� �̿��Ͻÿ�.
select  sum( decode(deptno, 10, sal, null)  )  as "10",
sum( decode(deptno, 20, sal, null)  )  as  "20",
sum( decode(deptno, 30, sal, null)  )  as  "30"
from emp;

�տ� ������ ���� �����鼭 ������ �μ���ȣ�� ��Ż������ ��µǰ� �Ͻÿ� !
select  job, sum( decode(deptno, 10, sal, null)  )  as "10",
sum( decode(deptno, 20, sal, null)  )  as  "20",
sum( decode(deptno, 30, sal, null)  )  as  "30"
from   emp
group   by  job;

- ���� SQL�� ������� ���� ����
	=> �μ���ȣ�� 10,20,30�� EMP ���̺� �ִٴ� ���� �ȴٴ� ���� �Ͽ� SQL�� �ۼ��ؾ� �Ѵ�. 
		 �𸥴ٰ� �����ϰ� sql�� �ۼ��� �� ����.
  => ���ο� �μ���ȣ�� �߰��Ǹ� �ٽ� sql�� ���ۼ� �ؾ� �Ѵ�.

SQL : ���ο� ������ ���ο� �μ���ȣ�� �Էµ� �� ���� SQL�� ��������� �Ѵ�.
PL/SQL : ���ο� ������ ���ο� �μ���ȣ�� �ԷµǾ ������ �� ���� ���ν����� �����ϸ� �ȴ�.

���� 1. ���� ����� PL/SQL ��  �����Ͻÿ� !
create or replace procedure get_data(p_x out sys_refcursor)
as
	l_query varchar2(400) := 'select job';
	l_deptno number;
begin
	for x in (select distinct deptno from emp order by 1)
	loop
		l_deptno := x.deptno;
		l_query := l_query || ', sum(decode(deptno, ' || l_deptno || ', sal)) as "' || l_deptno || '"';
	end loop;
	
	l_query := l_query || ' from emp group by job';
	open p_x for l_query;
end;
/

���ν��� �����ϱ�
variable x refcursor;
exec get_data(:x);
print x;