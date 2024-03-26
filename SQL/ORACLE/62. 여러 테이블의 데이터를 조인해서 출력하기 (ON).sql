-- emp와 dept를 조인해서 이름과 부서위치를 출력하시오. (1999 ANSI 문법)
select e.ename, d.loc
from emp e join dept d 
on (e.deptno = d.deptno);

-- on 절을 사용한 조인문법으로 직업이 salesman인 사원들의 이름, 월급, 직업과, 부서위치를 출력하시오. 
select e.ename, e.sal, e.job, d.loc 
from emp e join dept d 
on (e.deptno = d.deptno)
where e.job = 'SALESMAN';

-- on 절을 사용한 조인문법으로 EMP와 SALGRADE를 조인해서 이름, 월급, 급여등급을 출력하는데 
-- 급여등급이 2등급만 출력하시오. 
select e.ename, e.sal, s.grade
from emp e join salgrade s 
on (e.sal between s.losal and s.hisal) 
where s.grade = 2;

-- EMP와 dept와 salgrade를 조인해서 이름, 부서위치, 급여등급을 출력하시오. 
select e.ename, d.loc, s.grade 
from emp e join dept d on (e.deptno = d.deptno) 
            join salgrade s on(e.sal between s.losal and s.hisal);

-- 위의 결과를 다시 출력하는데 chicago에서 근무하는 사원들만 출력하시오. 
select e.ename, d.loc, s.grade 
from emp e join dept d on (e.deptno = d.deptno) 
            join salgrade s on(e.sal between s.losal and s.hisal)
where d.loc = 'CHICAGO';
