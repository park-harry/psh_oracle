-- ������ ���� ��µǴ� �÷����� �ѱ۷� ��µǰ� �Ͻÿ� 
select empno as �����ȣ, ename as ����̸�, sal as ���� 
    from emp;
-- as �� ���� ���� 

-- ����̸�, ������ �μ���ȣ�� ����ϴµ� �÷����� �ѱ۷� ����Ͻÿ�.
select ename as "��� �̸�", job as ����, deptno as "�μ� ��ȣ" 
    from emp;
    
--example 
select ename as "��� �̸�", sal as "salary*"
	from emp; 
    
-- column �� ��ҹ��ڸ� �����ؼ� ����ϰ� �ʹٸ� double quotation mark �� �ѷ���� �Ѵ�. 
select ename as "Employee name", sal as "Salary"
from emp; 

-- �μ� ���̺��� �μ� ��ȣ�� �μ� ��ġ�� ����ϴµ� column ���� Department number�� Department location ���� ��µǰ� �Ͻÿ�.
select deptno "Department number", loc "location"
from dept;

--��� ���̺��� �̸�, ����, ���� +300 *2�� ����Ͻÿ� 
select ename, sal, (sal+300)*2
from emp;

-- ���� ����� �ٽ� ����ϴµ� ���� +300 *2�� �÷����� ���ʽ��� ����Ͻÿ�
select ename, sal, (sal+300)*2 as bonus
from emp;