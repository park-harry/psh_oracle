예제 1. 아래의 SQL을 해쉬조인 하시오. (조인 순서는 dept -> emp 순에 되게 해라.) 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno; 

- 답: 
select /*+ leading(d,e) use_hash(e) */ e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno; 

예제 2. 아래 조인 문장의 해쉬 조인 순서를 결정하시오. 
select e.ename, d.loc
from emp e, dept d 
where e.deptno = d.deptno and e.ename = 'SCOTT'; 

- 답: 
@demo 
select  /*+  leading(e,d)  use_hash(d)  */ e.ename, d.loc
from  emp   e,  dept   d
where   e.deptno = d.deptno  and  e.ename='SCOTT';

문제 1. 아래의 SQL의 조인을 해쉬조인으로 수행하시오 !
- 튜닝 전: 
select /*+ leading(s t) use_nl(t)*/ t.calendar_year, sum(amount_sold) 
from sales200 s, times200 t 
where s.time_id = t.time_id 
	and t.week_ending_day_id = 1582 
group by t.calendar_year; 

=> 실행하였을 때 바로 안나온다. 

- 튜닝 후: 
select /*+ leading(t,s) use_hash(s)*/ t.calendar_year, sum(amount_sold) 
from sales200 s, times200 t 
where s.time_id = t.time_id 
	and t.week_ending_day_id = 1582 
group by t.calendar_year; 

=> 실행하였을 때 바로 나온다. 

문제 2. 아래의 환경을 만들고 아래의 SQL을 튜닝하시오. 
create table customers200 
as 
select * from sh.customers; 

select count(*) from customers200; 

- 튜닝 전: 
select  /*+  leading(s c)  use_nl(c) */  count(*)
from  sales200   s, customers200  c
where  s.cust_id = c.cust_id
and  c.country_id = 52790    
and  s.time_id between  to_date('1999/01/01','YYYY/MM/DD')
and  to_date('1999/12/31','YYYY/MM/DD');

- 튜닝 후: 
select  /*+  leading(c s)  use_hash(s) */  count(*)
from  sales200   s, customers200  c
where  s.cust_id = c.cust_id
and  c.country_id = 52790    
and  s.time_id between  to_date('1999/01/01','YYYY/MM/DD')
							and  to_date('1999/12/31','YYYY/MM/DD');

=> where 절 조건에서 2개의 테이블 중 count(*)가 더 작은 것이 앞에 와야 된다.