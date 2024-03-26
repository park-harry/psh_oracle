-- SCOTT 과 같은 직업을 가진 사원들의 월급을 8000으로 수정하시오. 
update emp 
set sal = 8000
where job = (select job from emp where ename = 'SCOTT');

-- ALLEN 보다 늦게 입사한 사원들의 commission 을 9000으로 수정하시오. 
update emp 
set comm = 9000 
where hiredate > (select hiredate from emp where ename = 'ALLEN');

-- KING의 월급을 ALLEN의 월급으로 변경하시오. 
update emp 
set sal = (select sal from emp where ename = 'ALLEN') 
where ename = 'KING';

-- KING의 부서번호를 JAMES의 부서번호로 변경하시오. 
update emp 
set deptno = (select sal from emp where ename = 'JAMES') 
where ename = 'KING';

-- emp와 dept를 조인해서 이름, 사원 테이블의 부서위치, 부서 테이블의 부서위치를
-- 출력하시오. 
select e.ename, e.loc as emp_loc, d.loc as dept_loc
from emp e, dept d 
where e.deptno = d.deptno;

-- update 절의 서브 쿼리를 이용해서 dept_loc의 컬럼을 emp_loc 컬럼에 갱신하시오. 
update (select e.ename, e.loc as emp_loc, d.loc as dept_loc
from emp e, dept d 
where e.deptno = d.deptno) 
set emp_loc = dept_loc;

-- emp18 테이블에 t_price 컬럼의 데이터를 null로 변경하고 commit 하시오. 
update emp18 
set t_price = null;

commit;

-- emp18 테이블과 telecom_table을 조인해서 이름, emp18 테이블의 t_price, telecom_table의 t_price 출력하시오. 
select e.ename, e.t_price, t.t_price
from emp18 e, telecom_table t
where e.telecom = t.telecom;

-- update 절의 서브 쿼리를 이용해서 TELECOM_t_price의 컬럼을 EMP_t_price 컬럼에 갱신하시오. 
update (select e.ename, e.t_price as emp_tprice, t.t_price as telecom_tprice
from emp18 e, telecom_table t
where e.telecom = t.telecom)
set emp_tprice = telecom_tprice;

-- sales200의 date_id에 값을 갱신하는데 time2의 date_id로 값을 갱신하시오. 
-- (merge 문이나 update 절을 이용한 서브쿼리로 하면 된다.) 
update (select s.date_id as s_date_id, t.date_id as t_date_id 
from sales200 s, time2 t 
where s.rn = t.rn)
set s_date_id = t_date_id;