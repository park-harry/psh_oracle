예제 1. emp 와 dept를 조인해서 이름과 부서위치를 출력하시오. 
@demo 
select ename, loc 
from emp e, dept d
where e.deptno = d.deptno; 
@p 

=> dept → emp 순의 조인 순서일 때는 buffer 개수 14개 

예제 2. 이번에는 조인순서를 emp -> dept 순이 되게 하시오. 
select /*+ ordered */ ename, loc 
from emp e, dept d 
where e.deptno = d.deptno; 

select  /*+ leading(e  d)  */  e.ename,  d.loc
from  emp  e,  dept   d
where   e.deptno = d.deptno; 
@p

문제 1.emp 와 salgrade 테이블을 조인해서  이름과 월급과 급여등급을 출력하는데
조인 순서가  salgrade -> emp 순이 되게하시오 !

select  /*+ leading(s,e)  */ e.ename,  e.sal,  s.grade
from  emp   e,  salgrade   s
where  e.sal  between  s.losal   and  s.hisal;
@p

문제 2.위의 조인순서를 emp -> salgrade 순이 되게하시오.
select  /*+ leading(e,s)  */ e.ename,  e.sal,  s.grade
from  emp   e,  salgrade   s
where  e.sal  between  s.losal   and  s.hisal;
@p