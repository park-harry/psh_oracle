-- oracle join 문법 
select e.ename, d.loc 
from emp e , dept d 
where e.deptno (+)= d.deptno;

-- 1999 ansi 문법 
select e.ename, d.loc 
from emp e right outer join dept d 
on (e.deptno = d.deptno);

-- oracle join 문법 
select e.ename, d.loc 
from emp e , dept d 
where e.deptno = d.deptno(+);

-- 1999 ansi 문법 
select e.ename, d.loc 
from emp e left outer join dept d 
on (e.deptno = d.deptno);

-- right outer join 을 이용해서 이름, 부서명을 출력하시오. 
select e.ename, d.loc 
from emp e right outer join dept d 
on (e.deptno = d.deptno);

-- 위의 결과를 다시 출력하는데 ename의 null 값이 맨 위에 오게 하시오. 
select e.ename, d.loc 
from emp e right outer join dept d 
on (e.deptno = d.deptno)
order by ename nulls first;

-- self join 을 1999 ansi 조인 문법으로 수행해서 사원 이름, 관리자의 사원 이름을 출력하시오. 
select e.ename as 사원이름, m.ename as 관리자이름
from emp e join emp m
on (e.mgr = m.empno);

-- 위의 결과를 다시 출력하는데 1999 ANSI 문법으로 사원 이름쪽에 KING 도 나오게 14 개의 행이 출력되게 하시오. 
-- 1999 ansi 문법
select e.ename as 사원이름, m.ename as 관리자이름
from emp e left outer join emp m
on (e.mgr = m.empno);

-- oracle 문법 
select e.ename as 사원이름, m.ename as 관리자이름
from emp e ,emp m
where e.mgr = m.empno(+);