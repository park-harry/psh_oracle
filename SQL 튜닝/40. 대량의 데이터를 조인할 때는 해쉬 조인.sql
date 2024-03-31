���� 1. �Ʒ��� SQL�� �ؽ����� �Ͻÿ�. (���� ������ dept -> emp ���� �ǰ� �ض�.) 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno; 

- ��: 
select /*+ leading(d,e) use_hash(e) */ e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno; 

���� 2. �Ʒ� ���� ������ �ؽ� ���� ������ �����Ͻÿ�. 
select e.ename, d.loc
from emp e, dept d 
where e.deptno = d.deptno and e.ename = 'SCOTT'; 

- ��: 
@demo 
select  /*+  leading(e,d)  use_hash(d)  */ e.ename, d.loc
from  emp   e,  dept   d
where   e.deptno = d.deptno  and  e.ename='SCOTT';

���� 1. �Ʒ��� SQL�� ������ �ؽ��������� �����Ͻÿ� !
- Ʃ�� ��: 
select /*+ leading(s t) use_nl(t)*/ t.calendar_year, sum(amount_sold) 
from sales200 s, times200 t 
where s.time_id = t.time_id 
	and t.week_ending_day_id = 1582 
group by t.calendar_year; 

=> �����Ͽ��� �� �ٷ� �ȳ��´�. 

- Ʃ�� ��: 
select /*+ leading(t,s) use_hash(s)*/ t.calendar_year, sum(amount_sold) 
from sales200 s, times200 t 
where s.time_id = t.time_id 
	and t.week_ending_day_id = 1582 
group by t.calendar_year; 

=> �����Ͽ��� �� �ٷ� ���´�. 

���� 2. �Ʒ��� ȯ���� ����� �Ʒ��� SQL�� Ʃ���Ͻÿ�. 
create table customers200 
as 
select * from sh.customers; 

select count(*) from customers200; 

- Ʃ�� ��: 
select  /*+  leading(s c)  use_nl(c) */  count(*)
from  sales200   s, customers200  c
where  s.cust_id = c.cust_id
and  c.country_id = 52790    
and  s.time_id between  to_date('1999/01/01','YYYY/MM/DD')
and  to_date('1999/12/31','YYYY/MM/DD');

- Ʃ�� ��: 
select  /*+  leading(c s)  use_hash(s) */  count(*)
from  sales200   s, customers200  c
where  s.cust_id = c.cust_id
and  c.country_id = 52790    
and  s.time_id between  to_date('1999/01/01','YYYY/MM/DD')
							and  to_date('1999/12/31','YYYY/MM/DD');

=> where �� ���ǿ��� 2���� ���̺� �� count(*)�� �� ���� ���� �տ� �;� �ȴ�.