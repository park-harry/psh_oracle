-- ��� ���̺��� �ִ� ������ ����Ͻÿ�. 
select max(sal) 
from emp;

-- ������ salesman �� ����� �߿��� �ִ� ������ ����Ͻÿ�. 
select max(sal) 
from emp 
where job = 'SALESMAN';

-- ���� ����� �ٽ� ����ϴµ� ������ ���� ����Ͻÿ�. 
select job, max(sal)
from emp 
where job = 'SALESMAN'
group by job;

-- ���� ������� where ���� ���� �����ϸ� �� job ���� max(sal)�� ���´�. 
select job, max(sal) 
from emp 
group by job; 

-- �μ���ȣ, �μ���ȣ �� �ִ� ������ ����Ͻÿ�. 
select deptno, max(sal) 
from emp 
group by deptno;

-- ����, ������ �ִ� ������ ����ϴµ� ������ salesman�� �����ϰ� ����Ͻÿ�.
select job, max(sal) 
from emp 
where job <> 'SALESMAN'
group by job;

-- ���� ����� �ٽ� ����ϴµ� ������ �ִ������ ���� �ͺ��� ����Ͻÿ�.
select job, max(sal) 
from emp 
where job <> 'SALESMAN'
group by job
order by max(sal) desc;

-- �츮 �� ���̺� ���� �÷� �߰��ϱ� 
alter table emp18 add age number(10); 

-- �߰��� �÷� age�� �ش� �л��� ���̷� ���� �����Ͻÿ�. 
update emp18 outer 
set age=(select trunc(months_between(sysdate,birth)/12)
        from emp18 
        where empno = outer.empno);

-- (���̵� ��)��Ż�, ��Ż� �� �ִ� ���̸� ����Ͻÿ�. 
select telecom, max(age) 
from emp18 
group by telecom;