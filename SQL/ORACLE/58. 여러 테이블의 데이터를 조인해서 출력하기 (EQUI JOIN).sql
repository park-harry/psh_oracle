-- emp와 dept 를 조인해서 이름과 부서위치를 출력하시오.
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno;

-- KING은 어느 부서에서 근무하는가? 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno and e.ename = 'KING';

-- 사원번호, 이름, 월급, 부서위치, 입사일을 출력하시오 (emp와 dept를 조인해서 출력하시오.) 
select e.empno, e.ename, e.sal, d.loc, e. hiredate 
from emp e, dept d 
where e.deptno = d.deptno; 

-- 사원번호, 이름, 월급, 부서위치, 부서번호를 출력하시오. 
select e.empno, e.ename, e.sal, d.loc, d.deptno 
from emp e, dept d 
where e.deptno = d.deptno; 

-- 위의 결과를 다시 출력하는데 부서위치가 dallas인 사원들만 출력하시오. 
select e.empno, e.ename, e.sal, d.loc, d.deptno 
from emp e, dept d 
where e.deptno = d.deptno and d.loc = 'DALLAS'; 

-- 월급이 1000에서 3000 사이인 사원들의 이름과 월급과 부서위치를 출력하시오. 
select e.ename, e.sal, d.loc
from emp e, dept d 
where e.deptno = d.deptno and e.sal between 1000 and 3000;

-- 우리반 테이블과 telecom_table을 조인해서 이름, 나이, 통신사, 통신비를 출력하시오. 
select e.ename, e.age, e.telecom, t.t_price
from emp18 e, telecom_table t
where e.telecom = t.telecom;

-- 위의 결과를 다시 출력하는데 통신사사 lg인 학생들만 출력하시오. 
select e.ename, e.age, e.telecom, t.t_price
from emp18 e, telecom_table t
where e.telecom = t.telecom and e.telecom = 'lg';

-- 부서번호, 부서번호 별 총 월급을 출력하시오. 
select deptno, sum(sal) 
from emp 
group by deptno;

-- 부서위치, 부서위치별 총 월급을 출력하시오. 
select d.loc, sum(e.sal)
from emp e, dept d
where e.deptno = d.deptno
group by d.loc;

-- emp 테이블과 bonus 테이블을 조인해서 이름, 월급, 보너스를 출력하시오. 
select e.ename, e.sal, b.b_bonus
from emp e, bonus b
where e.empno = b.empno;

-- emp와 dept와 bonus를 조인해서 이름, 월급, 보너스, 부서위치를 출력하시오. 
select e.ename, e.sal, b.b_bonus, d.loc
from emp e, bonus b, dept d
where e.empno = b.empno and e.deptno = d.deptno;

-- 위의 결과를 다시 출력하는데 부서위치가 dallas인 사원들만 출력하시오. 
select e.ename, e.sal, b.b_bonus, d.loc
from emp e, bonus b, dept d
where e.empno = b.empno and e.deptno = d.deptno and d.loc = 'DALLAS';

-- 이름에 S자를 포함하고 있는 사원들의 이름, 월급, 부서위치를 출력하시오. 
select e.ename, e.sal, d.loc 
from emp e, dept d 
where e.deptno = d.deptno and e.ename like '%S%';

-- 부서위치, 이름, 월급, 월급의 순위를 출력하는데 부서위치 별로 각각 월급의 순위가 출력되게 하시오. 
select d.loc, e.ename, e.sal, dense_rank() over (partition by d.loc order by e.sal) as 순위 
from emp e, dept d
where e.deptno = d.deptno;
