���� 1. ename�� scott �� ����� �̸��� �μ���ġ�� ����Ͻÿ�. 
select  e.ename,  d.loc
from  emp   e,   dept  d
where   e.deptno = d.deptno   and  e.ename='SCOTT';
@p

����2. ���� SQL�� ���� ������  �Ʒ��� 2���� �߿� ��� ������?
   1. dept  ->  emp
   2. emp -> dept 

��:  2��, �� ���� ���νõ��� �ϸ� �����̴�.
	=> �˻� ���ǿ� e.ename='SCOTT' �̱� ������ emp�� ���� �������ô� ���� ����. 

����1. �Ʒ��� SQL�� ���� ���� ���μ����� ��Ʈ�� ���Ͻÿ� !
select   e.ename, d.loc
from  emp   e,   dept   d
where  e.deptno  = d.deptno
		and   e.job='SALESMAN'   
		and   d.loc='CHICAGO';    

- ��: 
select  /*+ leading(d,e) */ e.ename,  d.loc
from  emp   e,   dept   d
where  e.deptno  = d.deptno
		and   e.job='SALESMAN'
		and   d.loc='CHICAGO';
		
=> d.loc='CHICAGO'�� 1��, e.job='SALESMAN'�� 4���̹Ƿ� �� ���� dept ���̺��� ���� ���°� �´�.

���� 2.�Ʒ��� ȯ���� �����ϰ� �Ʒ��� SQL�� Ʃ���ؼ� ������ ������ ���Ͻÿ� !
drop  table sales200 purge;

create  table  sales200
as
select * from sh.sales;

create table times200
as
select  * from sh.times;

- Ʃ���� :  
select  /*+  leading(s t) use_nl(t) */  
t.calendar_year,  sum(amount_sold)
from sales200  s, times200  t
where s.time_id = t.time_id
and t.week_ending_day_id =1582
group by  t.calendar_year; 
@p 

=> buffer 49����

- Ʃ���� : 
select  /*+ leading(t  s)  use_nl(s) */    
t.calendar_year,  sum(amount_sold)
from sales200  s, times200  t
where s.time_id = t.time_id
and t.week_ending_day_id =1582
group by  t.calendar_year;
@p 

=> buffer 4433�� 