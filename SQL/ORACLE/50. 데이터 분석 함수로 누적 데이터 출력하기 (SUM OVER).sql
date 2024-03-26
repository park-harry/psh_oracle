-- �̸�, ����, ������ ����ġ�� ����Ͻÿ�. 
select ename, sal, sum(sal) over (order by sal) ����ġ
from emp;

-- ���� ����� �ٽ� ����ϴµ� �ɼ��� full �� �� �Ἥ ����Ͻÿ�. 
select ename, sal, 
sum(sal) over (order by sal asc 
rows between unbounded preceding and current row) ����ġ
from emp;

-- �μ���ȣ, �̸�, ����, ������ ����ġ�� ��µǴµ� �μ���ȣ ���� ���� ������ ����ġ�� 
-- ��µǰ� �Ͻÿ�. 
select deptno, ename, sal, 
sum(sal) over (partition by deptno order by sal asc 
rows between unbounded preceding and current row) ����ġ 
from emp;

-- �Ʒ��� SQL�� Ʃ���Ͻÿ�. 
-- Ʃ�� �� 
select ename, sal ,
(select sum(sal) from emp  e2 
where e2.empno <= e1.empno) as ����ġ 
from emp e1 
order by empno;

-- Ʃ�� �� 
select ename, sal, 
sum(sal) over (order by sal asc rows between unbounded preceding and current row) ����ġ 
from emp;

-- �Ʒ��� SQL�� Ʃ���Ͻÿ�. 
select deptno, ename, sal, 
(select sum(sal) from emp e2 where e2.empno <= e1.empno
and e2.deptno = e1.deptno) ����ġ 
from emp e1
order by deptno, empno;

select deptno, ename, sal, 
sum(sal) over (partition by deptno order by empno asc 
rows between unbounded preceding and current row) ����ġ
from emp; 

-- emp ���̺��� �μ���ȣ�� ascending �ϰ� ������ ����� ������ emp2 ��� ���̺��� �����Ѵ�.
create table emp2
as
select  * from   emp
order by deptno asc ;

-- emp2 ���̺��� �μ���ȣ�� 10���� ������� �Ի����� 81/01/05 �� �����Ѵ�.
update emp2 
set hiredate = '81/01/05' 
where deptno=10;

update  emp2
set  hiredate = '81/02/17'
where  deptno = 20;

update  emp2
set  hiredate= '81/03/21'
where  deptno = 30;

commit;
select  * from  emp2;

-- range ������ �������� �̿��ؼ� ������ ���� ���Ѽ� ����Ͻÿ�. 
select ename, hiredate, sal, 
sum(sal) over(order by hiredate asc range between unbounded preceding and current row) ����ġ 
from emp2;

-- ������ salesman�� ������� �̸�, ����, ����, ������ ����ġ�� ����Ͻÿ�. 
select ename, job, sal, 
sum(sal) over(order by sal asc rows between unbounded preceding and current row) as ����ġ 
from emp 
where job = 'SALESMAN';