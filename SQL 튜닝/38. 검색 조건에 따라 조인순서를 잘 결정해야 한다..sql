예제 1. ename이 scott 인 사원의 이름과 부서위치를 출력하시오. 
select  e.ename,  d.loc
from  emp   e,   dept  d
where   e.deptno = d.deptno   and  e.ename='SCOTT';
@p

예제2. 위의 SQL의 조인 순서는  아래의 2가지 중에 어떤게 좋은가?
   1. dept  ->  emp
   2. emp -> dept 

답:  2번, 한 번만 조인시도를 하면 때문이다.
	=> 검색 조건에 e.ename='SCOTT' 이기 때문에 emp를 먼저 가져오시는 것이 좋다. 

문제1. 아래의 SQL의 가장 좋은 조인순서를 힌트로 정하시오 !
select   e.ename, d.loc
from  emp   e,   dept   d
where  e.deptno  = d.deptno
		and   e.job='SALESMAN'   
		and   d.loc='CHICAGO';    

- 답: 
select  /*+ leading(d,e) */ e.ename,  d.loc
from  emp   e,   dept   d
where  e.deptno  = d.deptno
		and   e.job='SALESMAN'
		and   d.loc='CHICAGO';
		
=> d.loc='CHICAGO'는 1개, e.job='SALESMAN'는 4개이므로 더 적은 dept 테이블이 먼저 오는게 맞다.

문제 2.아래의 환경을 구성하고 아래의 SQL을 튜닝해서 버퍼의 갯수를 비교하시오 !
drop  table sales200 purge;

create  table  sales200
as
select * from sh.sales;

create table times200
as
select  * from sh.times;

- 튜닝전 :  
select  /*+  leading(s t) use_nl(t) */  
t.calendar_year,  sum(amount_sold)
from sales200  s, times200  t
where s.time_id = t.time_id
and t.week_ending_day_id =1582
group by  t.calendar_year; 
@p 

=> buffer 49만개

- 튜닝후 : 
select  /*+ leading(t  s)  use_nl(s) */    
t.calendar_year,  sum(amount_sold)
from sales200  s, times200  t
where s.time_id = t.time_id
and t.week_ending_day_id =1582
group by  t.calendar_year;
@p 

=> buffer 4433개 