-- �μ���ȣ�� 20���� ������ ������ ���� ���� ������� �̸�, ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where deptno not in (select deptno from emp where deptno=20);

-- KING���� ���� �ϴ� ������� �̸��� ����Ͻÿ�. 
select ename 
from emp 
where mgr = (select empno from emp where ename = 'KING');

-- �������� ������� �̸��� ����Ͻÿ�. (�ڱ� �ؿ� ���� ���� ������� �ִ� �����) 
select ename 
from emp 
where empno in (select mgr from emp);

-- �����ڰ� �ƴ� ������� �̸��� ����Ͻÿ�. 
select ename 
from emp 
where empno not in (select mgr from emp where mgr is not null);

-- ������ salesman�� ������ ������ ���� ������� �̸�, ����, Ŀ�̼��� ����Ͻÿ�. 
select ename, sal, comm 
from emp 
where sal in (select sal from emp where job = 'SALESMAN');

-- ������ salesman�� ������ ���޵� ���� Ŀ�̼ǵ� ���� ������� �̸�, ����, Ŀ�̼�, ������ 
-- ����Ͻÿ�. 
select ename, sal, comm, job 
from emp 
where sal in (select sal from emp where job = 'SALESMAN')
and comm in(select comm from emp where job = 'SALESMAN') ;

// pairwise ��� 
select ename, sal, comm, job 
from emp 
where (sal,comm) in (select sal,comm from emp where job = 'SALESMAN');

-- �츮�ݿ��� ��Ż簡 kt�� �л���� ���̰� ���� ������ ���� �л����� �̸�, ����, ����, 
-- ��Ż縦 ����Ͻÿ�. (non piar wise �������) 
select ename, age, gender, telecom 
from emp18 
where age in (select age from emp18 where telecom = 'kt')
and gender in (select gender from emp18 where telecom = 'kt');

-- ���� ����� �ٽ� ����ϴµ� pairwise ������� ����Ͻÿ�. 
select ename, age, gender, telecom 
from emp18 
where (age,gender) in (select age,gender from emp18 where telecom = 'kt');