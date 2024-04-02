instead of trigger �� ����ϴ� ����
=> ���պ信 data�� �Է��ϱ� ���ؼ� ����Ѵ�.
=> view �� ���� 2����
  => �ܼ� view
    => table 1��
    => �׷��Լ� group by �� ���� ����
    => DML ��� ���ΰ� �����ϴ�.
  => ���� view
    => table 2�� �̻�
    => �׷��Լ� group by �� ����
    => DML ��� ���ΰ� �Ұ��� �� ���� �ִ�.
    
���� 1. DALLAS ���� �ٹ��ϴ� ������� �̸��� ���ް� �μ���ġ�� �μ���ȣ�� ����ϴ� ���պ並 
�����Ͻÿ� ! (VIEW �̸��� emp252)
CREATE OR REPLACE VIEW emp252
AS
    SELECT  e.empno, e.ename, e.sal, d.loc, d.deptno
    FROM emp e, dept d
    WHERE e.deptno = d.deptno
    AND d.loc = 'DALLAS';

SELECT *
FROM emp252;

���� 2.  emp252 view �� SMITH �� ������ 5000 ���� �����Ͻÿ�!
update emp252 
set sal = 5000 
where ename = 'SMITH';

=> 19c ������ view update�� ������ ���� 21c���ʹ� ������ ���� �ʴ´�.  

���� 3. �Ʒ��� ������ �����Ͻÿ�. 
insert into emp252 (empno, ename, sal, loc)
values(9999,'JANE',3000,'DALLAS');

=> ���� insert���� 21c�� �ȵȴ�. 

select * from v$version;
=> sql ���� ���� ��� 


���� 4. �����ȣ, �̸�, ����, �μ���ȣ, �μ����� ����ϴ� view �� �����Ͻÿ� !
CREATE VIEW emp255
AS
    SELECT e.empno, e.ename, e.sal, e.deptno, d.dname
    FROM emp e, dept d
    WHERE e.deptno = d.deptno;

select * from emp255;

���� 5. �Ʒ��� ������ ����� �� �ֵ��� intead of Ʈ���Ÿ� �����Ͻÿ�. 
create or replace trigger emp_dept_insert
instead of insert on emp255
referencing new as n -- NEW �� N ���� ��Ī����.
for each row
declare
dept_cnt number;
begin
    if :n.empno is not null then
    insert into emp(empno, ename, sal, deptno)
    values (:n.empno, :n.ename, :n.sal, :n.deptno);
    end if;
    
    if :n.deptno is not null then
    select count(*) into dept_cnt
    from dept where deptno = :n.deptno;
    
    if dept_cnt > 0 and (:n.dname is not null) then
            update dept set dname = :n.dname where deptno = :n.deptno;
    else insert into dept(deptno, dname) values(:n.deptno, :n.dname);
    end if;
    end if;
end;
/

INSERT INTO emp255 (empno, ename, sal, deptno, dname)
VALUES (8999, 'EYKIM', 4000, 10, 'HR');

SELECT *
FROM emp255;