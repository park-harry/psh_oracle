-- Jones�� ���޺��� �� ���� ������ �޴� ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where sal > (select sal 
            from emp 
            where ename = 'JONES');

-- scott�� ���� ������ �޴� ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where sal = (select sal 
            from emp 
            where ename = 'SCOTT');

-- ���� ������� �ٽ� ����ϴµ� SCOTT �� �����ϰ� ����Ͻÿ�.
select ename, sal 
from emp 
where sal = (select sal 
            from emp 
            where ename = 'SCOTT')
and ename <> 'SCOTT';

-- ALLEN ���� �ʰ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�. 
select ename, hiredate 
from emp 
where hiredate > (select hiredate from emp 
                    where ename = 'ALLEN');

-- price ���̺��� a_price�� �ִ밪�� ����Ͻÿ�. 
select max(a_price)
from price; 

-- ����� ���� ������ �߿� ���� ����(a_price)�� ��� ����ǰ(a_name)�� �� ������ ����Ͻÿ�. 
desc price;

select a_price, a_name
from price
where a_price = (select max(a_price) from price);

-- ������ SALESMAN�� ������߿� �ִ������ �޴� ����� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where sal = (select max(sal) from emp where job = 'SALESMAN');

-- ���� ����� ���������� �̿����� ���� order by ... fetch row �� �̿��ؼ� ����Ͻÿ�. 
select ename, sal 
from emp 
where job = 'SALESMAN'
order by sal desc fetch first 1 row only;

-- dba�� sql�� �� �� ������ �����ؼ� �����ϹǷ� ���� 2���� sql �� ��� sql�� �� ������ ������ 
-- Ȯ���ؾ� �Ѵ�. 
select /*+ gather_plan_statistics */ ename, sal 
from emp 
where sal = 
(select max(sal) 
from emp
where job = 'SALESMAN'); --> 12�� 

select * from table(dbms_xplan.display_cursor(null,null,'ALLSTATS LAST'));

select /*+ gather_plan_statistics */ ename, sal 
from emp 
where job = 'SALESMAN'
order by sal desc fetch first 1 rows only; --> buffer 6 

-- DALLAS�� �ִ� �μ���ȣ���� �ٹ��ϴ� ������� �̸��� ������ ����Ͻÿ�. (��������)
select ename, sal 
from emp 
where deptno = (select deptno from dept where loc = 'DALLAS');

-- ���� ������ join���� �����Ͻÿ�. 
select e.ename, e.sal 
from emp e, dept d 
where e.deptno = d.deptno and d.loc ='DALLAS';

-- �츮�� ���̺��� ��Ż簡 kt�� �л� �߿� ���̰� ���� ���� �л��� �̸�,����, ��Ż縦 ����Ͻÿ�. 
select ename, age, telecom 
from emp18 
where age = (select max(age) from emp18 where telecom = 'kt')
and telecom = 'kt';

-- ��Ż簡 kt�� �л��� �ִ� ���̺��� �� ���̰� ���� �л����� �̸��� ���̸� ����ϴµ� ���̰� ���� �л����� ����Ͻÿ�. 
select ename, age 
from emp18 
where age > (select max(age) from emp18 where telecom = 'kt') 
order by age desc; 

-- Allen�� ���� �μ���ȣ���� �ٹ��ϴ� ������� �̸�, ������ ����ϴµ� Allen�� �����ϰ� ����Ͻÿ�.
select ename, sal 
from emp 
where deptno = (select deptno from emp where ename = 'ALLEN') 
and ename <> 'ALLEN';
