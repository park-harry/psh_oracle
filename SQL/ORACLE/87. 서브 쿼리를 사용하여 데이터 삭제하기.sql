-- ��� ���̺��� ������ SALESMAN�� ������� ����ÿ�. 
delete from emp 
where job = 'SALESMAN';

rollback; 
-- �μ���ȣ�� 20���� ������� ����ÿ�. 
delete from emp 
where deptno=20;

-- SCOTT ���� �� ���� ������ �޴� ������� ����ÿ�. 
delete from emp 
where sal > (select sal from emp where ename = 'SCOTT');

-- ALLEN���� �ʰ� �Ի��� ������� ����ÿ�. 
delete from emp 
where hiredate > (select hiredate from emp where ename = 'ALLEN');




