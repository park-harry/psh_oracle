���� 1-1. ��� ���̺�  �μ���ȣ�� 10���� ������� �����͸� ����� PROCEDURE �� �����Ͻÿ�!
(���ν��� �̸�: delete_deptno)

create or replace procedure delete_deptno 
is 
		begin 
				delete from emp 
				where deptno = 10;
			commit;
		end;
/

execute  delete_deptno;

���� 1-2.  �μ���ȣ�� ���� �Է��ؼ� ���ν����� �����ϸ� �ش� �μ���ȣ�� ������� �����Ͱ� �������� 
���ν����� �����ϼ���.
 exec  delete_deptno(20);

create or replace procedure delete_deptno
		(p_deptno emp.deptno%type)
is 
		begin 
				delete from emp 
				where deptno = p_deptno;
			commit;
		end;
/