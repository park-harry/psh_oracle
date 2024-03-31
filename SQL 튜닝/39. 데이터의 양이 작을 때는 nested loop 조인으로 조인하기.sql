조인을 할 때 조인을 시도하는 데이터의 양이 작을 때는 nested loop 조인으로 조인을 한다. 
nested loop 조인은 조인 연결고리가 되는 컬럼에 인덱스를 엑세스 할 수 있냐 없냐에 따라서 수행 속도
차이가 크다. 

예제 1. 이름, 부서위치를 출력하는데 nested loop 조인으로 수행하시오. 
select /*+ leading (d,e) use_nl(e) */ e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno; 
@p 

=> use_nl 이 nested loop 조인을 하라는 힌트다.
=> use_nl에 오는 테이블은 leading 힌트에서 뒤에 오는 테이블이다.

예제 2.아래의 조인문장을 nested loop 조인으로 유도하시오. 
select  e.ename, d.loc, e.sal
from   emp  e,  dept   d
where   e.deptno = d.deptno  
and    e.ename='SCOTT';

- 답: 
select  /*+ leading(e,d)  use_nl(d) */  e.ename, d.loc, e.sal
from emp e,, dept d
where e.deptno = d.deptno  
and e.ename='SCOTT';

예제3.  dept 테이블에 deptno 에 인덱스를 거는데 unique 인덱스로 생성하시오 
create  unique   index   dept_deptno
on  dept(deptno);

예제4. 아래의 SQL의 실행계획을 확인하시오 !
select  /*+ leading(e,d)  use_nl(d)  index(d dept_deptno) */  e.ename, d.loc, e.sal
from emp e, dept d
where e.deptno = d.deptno and e.ename='SCOTT';

예제5.  emp 테이블에 ename 에 인덱스를 생성하시오 
create  index  emp_ename  on  emp(ename);

예제6. 다시  예제4번의 SQL을 작성하시오 !
select  /*+ leading(e,d)  use_nl(d)  
	      index(d  dept_deptno)  index(e  emp_ename) */  e.ename, d.loc, e.sal
from   emp  e,  dept   d
where   e.deptno = d.deptno  
and    e.ename='SCOTT';

=> nested loop 조인은 연결고리가 되는 컬럼에 인덱스가 있어야 한다. 그래야 좋은 성능을 보인다.
=> 위의 코드의 경우 emp 테이블의 인덱스와 dept 테이블의 인덱스가 모두 있으면 좋다.

문제 1. 아래의 SQL 조인문을 nested loop 조인으로 수행되게하는데 조인순서를 올바르게 고치고  
인덱스가 필요한 컬럼에 인덱스를 거시오.

- 튜닝전 :  
select  /*+  leading(s t) use_nl(t) */  
t.calendar_year,  sum(amount_sold)
from sales200  s, times200  t
where s.time_id = t.time_id
	and t.week_ending_day_id =1582
group by  t.calendar_year;

- 튜닝후: 
create  index  sales200_time_id on   sales200(time_id);

select  /*+  leading(t s) use_nl(s) */  
t.calendar_year,  sum(amount_sold)
from sales200  s, times200  t
where s.time_id = t.time_id
	and t.week_ending_day_id =1582
group by  t.calendar_year;