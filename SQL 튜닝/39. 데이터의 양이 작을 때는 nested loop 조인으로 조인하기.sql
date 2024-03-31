������ �� �� ������ �õ��ϴ� �������� ���� ���� ���� nested loop �������� ������ �Ѵ�. 
nested loop ������ ���� ������� �Ǵ� �÷��� �ε����� ������ �� �� �ֳ� ���Ŀ� ���� ���� �ӵ�
���̰� ũ��. 

���� 1. �̸�, �μ���ġ�� ����ϴµ� nested loop �������� �����Ͻÿ�. 
select /*+ leading (d,e) use_nl(e) */ e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno; 
@p 

=> use_nl �� nested loop ������ �϶�� ��Ʈ��.
=> use_nl�� ���� ���̺��� leading ��Ʈ���� �ڿ� ���� ���̺��̴�.

���� 2.�Ʒ��� ���ι����� nested loop �������� �����Ͻÿ�. 
select  e.ename, d.loc, e.sal
from   emp  e,  dept   d
where   e.deptno = d.deptno  
and    e.ename='SCOTT';

- ��: 
select  /*+ leading(e,d)  use_nl(d) */  e.ename, d.loc, e.sal
from emp e,, dept d
where e.deptno = d.deptno  
and e.ename='SCOTT';

����3.  dept ���̺� deptno �� �ε����� �Ŵµ� unique �ε����� �����Ͻÿ� 
create  unique   index   dept_deptno
on  dept(deptno);

����4. �Ʒ��� SQL�� �����ȹ�� Ȯ���Ͻÿ� !
select  /*+ leading(e,d)  use_nl(d)  index(d dept_deptno) */  e.ename, d.loc, e.sal
from emp e, dept d
where e.deptno = d.deptno and e.ename='SCOTT';

����5.  emp ���̺� ename �� �ε����� �����Ͻÿ� 
create  index  emp_ename  on  emp(ename);

����6. �ٽ�  ����4���� SQL�� �ۼ��Ͻÿ� !
select  /*+ leading(e,d)  use_nl(d)  
	      index(d  dept_deptno)  index(e  emp_ename) */  e.ename, d.loc, e.sal
from   emp  e,  dept   d
where   e.deptno = d.deptno  
and    e.ename='SCOTT';

=> nested loop ������ ������� �Ǵ� �÷��� �ε����� �־�� �Ѵ�. �׷��� ���� ������ ���δ�.
=> ���� �ڵ��� ��� emp ���̺��� �ε����� dept ���̺��� �ε����� ��� ������ ����.

���� 1. �Ʒ��� SQL ���ι��� nested loop �������� ����ǰ��ϴµ� ���μ����� �ùٸ��� ��ġ��  
�ε����� �ʿ��� �÷��� �ε����� �Žÿ�.

- Ʃ���� :  
select  /*+  leading(s t) use_nl(t) */  
t.calendar_year,  sum(amount_sold)
from sales200  s, times200  t
where s.time_id = t.time_id
	and t.week_ending_day_id =1582
group by  t.calendar_year;

- Ʃ����: 
create  index  sales200_time_id on   sales200(time_id);

select  /*+  leading(t s) use_nl(s) */  
t.calendar_year,  sum(amount_sold)
from sales200  s, times200  t
where s.time_id = t.time_id
	and t.week_ending_day_id =1582
group by  t.calendar_year;