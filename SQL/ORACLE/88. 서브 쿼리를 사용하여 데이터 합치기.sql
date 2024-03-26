-- emp 테이블에 loc 컬럼을 추가하시오. 
alter table emp add loc varchar2(10); 

-- merge 문을 이용해서 지금 방금 추가한 loc의 데이터를 해당 사원의 부서위치로 값을 갱신하시오. 
merge into emp e 
using dept d 
on (e.deptno = d.deptno) 
when matched then 
update set e.loc = d.loc; 

-- dept 테이블에 sumsal이라는 컬럼을 추가하시오. 
alter table dept add sumsal number(10); 

-- 사원 테이블에서 부서번호를 뽑고, 부서번호 별 토탈 월급을 출력하시오. 
select deptno, sum(sal) 
from emp 
group by deptno; 

-- merge 문을 이용해서 dept 테이블을 merge 하는데 해당 부서의 토탈 월급으로 값을 갱신하시오. 
merge into dept d 
using (select deptno, sum(sal) as sumsal from emp group by deptno) e
on (d.deptno = e.depno) 
when matched then 
update set d.sumsal = e.sumsal; 


-- dept 테이블에 cnt 라는 컬럼을 추가하고 해당 부서 위치의 인원수로 값을 갱신하시오. 
alter table dept add cnt number(10); 

merge into dept d 
using (select deptno, count(*) as cnt from emp group by deptno) e
on (d.deptno = e.deptno) 
when matched then 
update set d.cnt = e.cnt;