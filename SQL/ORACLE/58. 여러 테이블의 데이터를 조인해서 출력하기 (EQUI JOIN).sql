-- emp�� dept �� �����ؼ� �̸��� �μ���ġ�� ����Ͻÿ�.
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno;

-- KING�� ��� �μ����� �ٹ��ϴ°�? 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno and e.ename = 'KING';

-- �����ȣ, �̸�, ����, �μ���ġ, �Ի����� ����Ͻÿ� (emp�� dept�� �����ؼ� ����Ͻÿ�.) 
select e.empno, e.ename, e.sal, d.loc, e. hiredate 
from emp e, dept d 
where e.deptno = d.deptno; 

-- �����ȣ, �̸�, ����, �μ���ġ, �μ���ȣ�� ����Ͻÿ�. 
select e.empno, e.ename, e.sal, d.loc, d.deptno 
from emp e, dept d 
where e.deptno = d.deptno; 

-- ���� ����� �ٽ� ����ϴµ� �μ���ġ�� dallas�� ����鸸 ����Ͻÿ�. 
select e.empno, e.ename, e.sal, d.loc, d.deptno 
from emp e, dept d 
where e.deptno = d.deptno and d.loc = 'DALLAS'; 

-- ������ 1000���� 3000 ������ ������� �̸��� ���ް� �μ���ġ�� ����Ͻÿ�. 
select e.ename, e.sal, d.loc
from emp e, dept d 
where e.deptno = d.deptno and e.sal between 1000 and 3000;

-- �츮�� ���̺�� telecom_table�� �����ؼ� �̸�, ����, ��Ż�, ��ź� ����Ͻÿ�. 
select e.ename, e.age, e.telecom, t.t_price
from emp18 e, telecom_table t
where e.telecom = t.telecom;

-- ���� ����� �ٽ� ����ϴµ� ��Ż�� lg�� �л��鸸 ����Ͻÿ�. 
select e.ename, e.age, e.telecom, t.t_price
from emp18 e, telecom_table t
where e.telecom = t.telecom and e.telecom = 'lg';

-- �μ���ȣ, �μ���ȣ �� �� ������ ����Ͻÿ�. 
select deptno, sum(sal) 
from emp 
group by deptno;

-- �μ���ġ, �μ���ġ�� �� ������ ����Ͻÿ�. 
select d.loc, sum(e.sal)
from emp e, dept d
where e.deptno = d.deptno
group by d.loc;

-- emp ���̺�� bonus ���̺��� �����ؼ� �̸�, ����, ���ʽ��� ����Ͻÿ�. 
select e.ename, e.sal, b.b_bonus
from emp e, bonus b
where e.empno = b.empno;

-- emp�� dept�� bonus�� �����ؼ� �̸�, ����, ���ʽ�, �μ���ġ�� ����Ͻÿ�. 
select e.ename, e.sal, b.b_bonus, d.loc
from emp e, bonus b, dept d
where e.empno = b.empno and e.deptno = d.deptno;

-- ���� ����� �ٽ� ����ϴµ� �μ���ġ�� dallas�� ����鸸 ����Ͻÿ�. 
select e.ename, e.sal, b.b_bonus, d.loc
from emp e, bonus b, dept d
where e.empno = b.empno and e.deptno = d.deptno and d.loc = 'DALLAS';

-- �̸��� S�ڸ� �����ϰ� �ִ� ������� �̸�, ����, �μ���ġ�� ����Ͻÿ�. 
select e.ename, e.sal, d.loc 
from emp e, dept d 
where e.deptno = d.deptno and e.ename like '%S%';

-- �μ���ġ, �̸�, ����, ������ ������ ����ϴµ� �μ���ġ ���� ���� ������ ������ ��µǰ� �Ͻÿ�. 
select d.loc, e.ename, e.sal, dense_rank() over (partition by d.loc order by e.sal) as ���� 
from emp e, dept d
where e.deptno = d.deptno;
