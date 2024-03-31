부서번호와 부서번호별 토탈월급을 출력하는데 가로로 출력하시오.
sum과 decode 를 이용하시오.
select  sum( decode(deptno, 10, sal, null)  )  as "10",
sum( decode(deptno, 20, sal, null)  )  as  "20",
sum( decode(deptno, 30, sal, null)  )  as  "30"
from emp;

앞에 직업도 같이 나오면서 직업별 부서번호별 토탈월급이 출력되게 하시오 !
select  job, sum( decode(deptno, 10, sal, null)  )  as "10",
sum( decode(deptno, 20, sal, null)  )  as  "20",
sum( decode(deptno, 30, sal, null)  )  as  "30"
from   emp
group   by  job;

- 위의 SQL만 사용했을 때의 단점
	=> 부서번호가 10,20,30이 EMP 테이블에 있다는 것을 안다는 가정 하에 SQL을 작성해야 한다. 
		 모른다고 가정하고 sql을 작성할 수 없다.
  => 새로운 부서번호가 추가되면 다시 sql을 재작성 해야 한다.

SQL : 새로운 직업과 새로운 부서번호가 입력될 때 마다 SQL을 변경해줘야 한다.
PL/SQL : 새로운 직업과 새로운 부서번호가 입력되어도 수정할 것 없고 프로시져만 수행하면 된다.

문제 1. 위의 결과를 PL/SQL 로  수행하시오 !
create or replace procedure get_data(p_x out sys_refcursor)
as
	l_query varchar2(400) := 'select job';
	l_deptno number;
begin
	for x in (select distinct deptno from emp order by 1)
	loop
		l_deptno := x.deptno;
		l_query := l_query || ', sum(decode(deptno, ' || l_deptno || ', sal)) as "' || l_deptno || '"';
	end loop;
	
	l_query := l_query || ' from emp group by job';
	open p_x for l_query;
end;
/

프로시져 실행하기
variable x refcursor;
exec get_data(:x);
print x;