-- emp 테이블과 salgrade 테이블을 서로 조인해서 이름, 월급, 급여등급(grade)을 출력하시오. 
select e.ename, e.sal, s.grade 
from emp e, salgrade s 
where e.sal between s.losal and s.hisal;

-- 위의 결과를 다시 출력하는데 grade가 2등급만 나오게 출력하시오. 
select e.ename, e.sal, s.grade 
from emp e, salgrade s 
where e.sal between s.losal and s.hisal 
and s.grade =2;

-- emp, dept, salgrade 테이블을 조인해서 dallas에서 근무하는 사원들의 이름, 부서위치, 월급, 급여등급을 출력하시오. 
select e.ename, d.loc, e.sal, s.grade 
from emp e, dept d, salgrade s 
where e.sal between s.losal and s.hisal and e.deptno = d.deptno 
and d.loc = 'DALLAS';

-- emp, dept를 조인해서 부서위치를 출력하고 부서위치 별로 속한 사원들의 이름을 가로로 출력하시오. 
select d.loc, listagg(e.ename, ',') within group (order by ename asc)
from emp e, dept d 
where e.deptno = d.deptno
group by d.loc;

-- 부서위치 별 총 월급을 출력하는데 맨 아래에 총 월급을 출력하시오. 
select d.loc, sum(e.sal) 
from emp e, dept d 
where e.deptno = d.deptno 
group by rollup(d.loc);

-- emp와 dept와 salgrade를 조인해서 결과를 출력하는데 CHICAGO에서 근무하는 사원들의 이름, 
-- 월급, 부서위치, 부서명, grade를 출력하시오. 
select e.ename, e.sal, d.loc, d.dname, s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno and e.sal between s.losal and s.hisal
and d.loc = 'CHICAGO'; 

-- 급여등급, 급여등급 별로 해당하는 사원들의 이름을 가로로 출력되게 하시오. 
-- 가로로 출력될 때 월급이 높은 사원 순으로 출력되게 하시오. 
select s.grade, listagg(e.ename,',') within group (order by e.sal desc) as ename 
from emp e, salgrade s 
where e.sal between s.losal and s.hisal
group by s.grade; 
