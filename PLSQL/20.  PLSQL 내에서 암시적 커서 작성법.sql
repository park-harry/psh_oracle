���ν����� �����ϰ� �����ϸ� ������������ ����Ǿ��١� ��� �޼����� ��� �ȴ�. 
�׷��� UPDATE  ���� ���Ե� ���ν����� ��� �� ���� ���� ���� �Ǿ��� ��� �޼����� ��� �Ǹ� 
�����Ͱ� �� ���� �Ǿ��ٴ� ���� Ȯ���� �� �� ���� �ٵ� �׷� ���� ���� �׳� ���������� ����Ǿ��ٰ�
��µȴ�.

����.
create   or  replace   procedure    update_deptno
		(  p_deptno     emp.deptno%type )
as
		begin
			update    emp
			set   comm=9000
			where  deptno= p_deptno;
    commit;
end;
/

execute  update_deptno(20);

�׷��� ����Ŭ ������ �Ͻ��� Ŀ�� �Լ��� �����ϰ� �ִ�. 
�Ͻ��� Ŀ�� �Լ��� �̿��ϸ� �� ���� ���ŵǾ��� ��� ������ش�.

�� �Ͻ��� Ŀ���� ���� 3����
1. SQL%FOUND : ���� �ֱٿ� ������ SQL���� �� �� �̻� ������ ���� ��� TRUE
2. SQL%NOTFOUND : ���� �ֱٿ� ������ SQL���� �� �࿡�� ������ ���� ���� ��� TRUE
3. SQL%ROWCOUNT : ���� �ֱ��� SQL���� ���� ������ ���� ���� ������ �����ϴ� �Լ�

���� 1. ������ ���ν����� �Ͻ��� Ŀ���� �̿��Ͽ� ����� ���� �������ٶ�� �޼����� ��µǰ� 
�Ͻÿ�.
set serveroutput on 
create    or   replace    procedure     delete_deptno
		( p_deptno   number )
is
		begin
		delete    from    emp
		where   deptno = p_deptno;
    dbms_output.put_line( SQL%rowcount  || '���� ���������ϴ�. ' );
    commit;
end;
/

exec delete_deptno(20);

���� 2. ������ ���ν����� �Ͻ��� Ŀ���� �̿��Ͽ� ����� ���� ���ŵǾ��ٶ�� �޼����� ��µǰ� 
�Ͻÿ�.
set serveroutput on 
create   or  replace   procedure    update_deptno
		(p_deptno     emp.deptno%type )
as
		begin
		update    emp
		set   comm=9000
		where  deptno= p_deptno;
		dbms_output.put_line(SQL%rowcount || '���� ���ŵǾ����ϴ�.');
		commit;
end;
/

exec update_deptno(20);