���� 1. �μ���ȣ, �μ���ȣ�� ��Ż������ ����ϵ��� SQL�� �ۼ��ϼ���
select deptno, sum(sal) 
from emp 
group by deptno;

���� 2. �μ���ȣ�� �μ���ȣ�� ��Ż������ ���η� ����ϵ��� SQL�� �ۼ��ϼ���
select sum(decode(deptno,10,sal,null)) as "10",
         sum(decode(deptno,20,sal,null)) as "20",
          sum(decode(deptno,30,sal,null)) as "30"
from emp ;

���� 3. ������ �μ���ȣ�� ��Ż������ �Ʒ��� ���� ��µǰ� SQL�� �ۼ��ϼ���.
select job, sum(decode(deptno,10,sal,null)) as "10",
         sum(decode(deptno,20,sal,null)) as "20",
          sum(decode(deptno,30,sal,null)) as "30"
from emp 
group by job;

���� 4.�μ���ȣ�� ������ ��տ����� ���η� ����ϼ��� !
select deptno, avg(decode(job,'ANALYST',sal,null)) as "ANALYST",
         avg(decode(job,'CLERK',sal,null)) as "CLERK",
         avg(decode(job,'MANAGER',sal,null)) as "MANAGER",
         avg(decode(job,'SALESMAN',sal,null)) as "SALESMAN",
         avg(decode(job,'PRESIDENT',sal,null)) as "PRESIDENT"
from emp 
group by deptno;