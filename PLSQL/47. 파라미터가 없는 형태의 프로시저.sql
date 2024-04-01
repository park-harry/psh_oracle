- �Է� �Ķ���Ͱ� ���� ���ν��� ����
create  [ or replace ] procedure [ ���ν��� �̸� ]
is | as
		[ ����� ]
begin
		[ ����� ]
		exception
		[ ���� ó���� ]
end [ ���ν��� �̸� ];


- �Ķ���Ͱ� ���� ���ν��� ���� ����
1. demo.sql �� �����ؼ� emp �� dept ���̺��� �ʱ�ȭ ��Ų��.
@demo 

2. emp ���̺� grade �÷��� �߰��ϰ� �̸�, ����, grade�� ��ȸ�Ѵ�. 

alter table emp 
add grade varchar2(10);

select ename, sal, grade
from emp;

���ν��� ������� ���� �͸� PL/SQL �� �ڵ�
3. emp ���̺� grade ��� �÷��� ������ ���ǿ� �ش�Ǵ� �����ͷ� ���� �����Ͻÿ�.

	������ 3000 �̻��̸� A ���
	������ 2000 �̻��̸� B ���
	������ 1000 �̻��̸� C ���
	������ ������ D �������  ����
	��, ������ ���� ������� �����  null �� ���ŵǾ�� �Ѵ�.

declare
    cursor    emp_cursor    is
    select    empno, ename, sal
    from  emp
    for  update;
        emp_record    emp_cursor%rowtype;
        v_grade       varchar2(5);
begin
    open   emp_cursor  ;
        loop
        fetch    emp_cursor    into   emp_record;
        exit   when   emp_cursor%notfound;
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
        end  loop;
        commit;
    close   emp_cursor;
end;
/

4. grade �÷��� null ������ �����Ѵ�.
update  emp
set  grade = null;
commit;

5. ���ν��� ���� �ڵ�
exec pro2;


���� 1. grade �÷��� null ������ �����մϴ�.
update emp 
set grade = null;

���� 2. SMITH �� ������ null ������ �����մϴ�.
update emp 
set sal = null
where ename = 'SMITH';
commit;

���� 3. SMITH ó�� ������ NULL ���� ������� GRADE �� ���ŵ��� �ʵ��� ���ν����� �����Ͻÿ�. 
create or replace procedure  pro2
is
    cursor    emp_cursor    is
    select    empno, ename, sal
    from  emp
    where sal is not null
    for  update;
        emp_record    emp_cursor%rowtype;
        v_grade       varchar2(5);
begin
    open   emp_cursor  ;
        loop
        fetch    emp_cursor    into   emp_record;
        exit   when   emp_cursor%notfound;
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
        end  loop;
        commit;
    close   emp_cursor;
end;
/

exec pro2;