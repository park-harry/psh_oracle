desc emp 
-- emp ���̺��� ������ Ȯ���ϴ� ��ɾ� 
-- desc �� describe�� ���� 

-- ��� ���̺��� �̸��� ������ ����Ͻÿ�. 
select ename, sal from emp;

-- ��� ���̺��� �̸��� ������ �μ���ȣ�� ����Ͻÿ�. 
select ename, job, deptno from emp; 

-- ��� ���̺��� �����ȣ, �̸�, ����, �Ի����� ����Ͻÿ�.
select empno, ename, sal, hiredate from emp; 

-- ������̺��� �����ȣ, �̸�, ����, ����, Ŀ�̼�, �μ���ȣ�� ����Ͻÿ�.
select empno, ename, sal, job, comm, deptno from emp;
desc dept;

-- dept ���̺��� ������ Ȯ���Ͻÿ� 
desc dept   

-- �μ� ���̺��� �μ���ġ�� ����Ͻÿ� 
select loc from dept; 

-- �μ� ���̺��� �μ���ġ�� �μ����� ����Ͻÿ�. 
select loc, dname from dept; 

