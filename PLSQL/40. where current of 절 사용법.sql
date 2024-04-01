���� 1. emp ���̺� grade ��� �÷��� �߰��Ͻÿ� !
alter  table  emp
add  grade  varchar2(10);

���� 2. emp ���̺� grade ��� �÷��� ������ ���ǿ� �ش�Ǵ� �����ͷ� ���� �����Ͻÿ�!
	������ 3000 �̻��̸� A ���
	������ 2000 �̻��̸� B ���
	������ 1000 �̻��̸� C ���
	������ ������ D �������  ����
	

declare 
    cursor emp_cursor is  -- Ŀ�� ���� 
    select empno, ename, sal 
    from emp
    for update; 
=> �ڿ��� where current of �� ������ �ݵ�� for update�� ����� �Ѵ�. 
	 for update�� ���� �ٸ� ����� update ���ϰ� lock�� �ɾ� ���°Ŵ�. 
    emp_record       emp_cursor%rowtype;
    v_grade           emp.grade%type;

begin
    open emp_cursor; -- Ŀ�� ���� 
        loop 
            fetch emp_cursor into emp_record; -- Ŀ�� ��ġ 
            exit when emp_cursor%notfound;   
         
            if   emp_record.sal >= 3000  then
                  v_grade  := 'A';
            elsif    emp_record.sal >= 2000  then
                 v_grade := 'B';
            elsif     emp_record.sal >=1000   then
                 v_grade := 'C' ;
            else
                 v_grade  := 'D';
            end  if;

           update   emp
           set   grade = v_grade
           where   current  of   emp_cursor;	-- fetch �ؿ� ���� data		
        end loop;
        commit;
    close emp_cursor; -- Ŀ�� �ݱ� 
end;
/

���� 1. ��� �����ߴ� ������ ���ν����� ���� ������ ���� ������ �Է��ϰ� �����ϸ�
�ش� ������ ������� �����͸� �Ʒ��� ������ ���ǿ� ���� grade ���� ���ŵǰ��Ͻÿ�.
update emp 
set grade = null;
commit;

create or replace procedure cursor_job
(p_job emp.job%type)
is
    cursor emp_cursor is  -- Ŀ�� ���� 
    select empno, ename, sal 
    from emp
    where job = p_job
    for update; 
    
    emp_record       emp_cursor%rowtype;
    v_grade           emp.grade%type;

begin
    open emp_cursor;
        loop 
            fetch emp_cursor into emp_record;
            exit when emp_cursor%notfound;   
            
            if   emp_record.sal >= 3000  then
                  v_grade  := 'A';
            elsif    emp_record.sal >= 2000  then
                 v_grade := 'B';
            elsif     emp_record.sal >=1000   then
                 v_grade := 'C' ;
            else
                 v_grade  := 'D';
            end  if;

           update   emp
           set   grade = v_grade
           where   current  of   emp_cursor;
        end loop;
        commit;
    close emp_cursor;
end;
/

exec  cursor_job('SALESMAN');