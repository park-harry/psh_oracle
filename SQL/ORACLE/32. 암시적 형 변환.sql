-- ������ SQL�� ������ �ȳ��� �� ������ �Ǵ°�? 
select ename, sal
from emp
where sal = '3000';
-- ����ȴ�. -> �Ͻ��� �� ��ȯ�� �߻���. 
-- single quotation mark�� ���� ���������� ��ȯ�Ǽ� ������ζ�� ������ ���� ������  
-- ����Ŭ�� �Ͻ������� �������� '3000'�� �������� 3000���� ��ȯ�ߴ�. 

-- Ȯ���غ��� (SQL�� ���� ��ȹ�� Ȯ���ϴ� ��� 
explain plan for 
select ename, sal
from emp
where sal = '3000';
-- ���� ���� 
select * from table(dbms_xplan.display);

-- '3000'�� 3000���� ��ȯ�Ǿ���. 

--  ������ SQL�� ������ �ȳ��� �� ������ �Ǵ°�? 
select ename, sal
from emp 
where sal like '30%';

-- ����ȴ�. -> �Ͻ��� �� ��ȯ�� �߻���. 
-- sal column �� ���������� ��ȯ�Ǿ���. 
-- ������ζ�� ���������� ��ȯ�Ǿ�� ������ %�� ���������� ��ȭ�� �� ���� ������ 
-- sal �� ���������� ��ȯ�Ǿ���. 

-- �Ʒ��� ���̺�� �����͸� ����� �Ʒ��� ������ �����ϸ� ����Ǵ��� Ȯ���Ͻÿ�. 
create   table   emp100
( ename   varchar2(10),
  sal         varchar2(10) );

insert  into  emp100  values('scott', '3000' );
insert  into  emp100  values('smith', '1200' );
commit;

select   ename, sal
  from  emp100
  where  sal = 3000;
-- �Ͻ��� �� ��ȯ �߻� 
-- sal column �� ���������� ��ȯ�Ǿ���. 