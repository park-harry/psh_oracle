-- emp, dept 를 조인해서 이름과 부서위치를 출력하시오. 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno;

-- 부서 번호 40번을 가지고 있는 사원이 emp에 없기 때문에 위의 SQL로는 부서위치 BOSTON이 
-- 나오지 않는다. 
-- OUTER JOIN을 써서 BOSTON 을 나오게 해야 한다. 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno (+)= d.deptno;

--EMP 테이블에는 존재하지만 DEPT 테이블에는 존재하지 않은 부서번호에 대한 사원이름과 부서위치가 출력되게 하시오. 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno(+);

-- 위의 결과를 다시 출력하는데 jack만 출력하시오. 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno(+) and e.ename = 'JACK';