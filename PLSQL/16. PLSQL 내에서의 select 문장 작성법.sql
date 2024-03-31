 select .. into 절을 사용할 때는 1개의 행만 인출해야 한다. 다음과 같이 여러개의 값을 
 인출하려 하면 오류가 발생한다.

set  serveroutput   on
declare
		v_ename     varchar2(25);
begin
		select  ename   into   v_ename
		from   emp
		where   job='SALESMAN';

		dbms_output.put_line( v_ename );
end;
/

=> 직업이 SALESMAN인 사원들의 이름은 여러개다. v_ename은 스칼라 변수인데 스칼라 변수는 
값을 1개만 담을 수 있다. 그러므로 위의 코드는 오류가 발생한다. 
여러 개의 행을 인출할 때는 select .. into를 사용하면 안 되고 뒤에서 배울 bulk ... into를 
사용하면 가능하다. 

ORA-01422: 실제 인출은 요구된 것보다 많은 수의 행을 추출합니다

문제 1. 부서번호를 물어보게 하고 부서번호를 입력하면 해당 부서번호의 토탈월급이 출력되게하시오 !
set serveroutput on 
accept   p_deptno   prompt   '부서번호를 입력하세요 ~ '

declare 
		v_deptno emp.deptno%type := &p_deptno;
		v_sumsal  number(10,2);
begin 
		select sum(sal) into v_sumsal
		from emp 
		where deptno = v_deptno;
		dbms_output.put_line ( '토탈월급은 : '  ||  v_sumsal  );
end;
/

group 함수의 특징
=> null 값을 무시합니다.
=> where 절의 조건이 거짓이어도 결과를 return 한다.
  => 예: max, sum,avg,min 은 null 값을 return 한다.
	   count 는 0을 return 한다. 선택된 레코드가 없다고 출력 되지 않는다.
	   
문제 2. 직업을 물어보게 하고 직업을 입력하면 해당 직업의 토탈월급이 출력되게 하는 PL/SQL 을 
작성하시오!
		직업을 입력하세요 !   SALESMAN
		토탈월급은  5600  입니다. 

set serveroutput on 
accept p_job prompt '직업을 입력하세요!'

declare 
	v_job  emp.job%type := '&p_job';
	v_sumsal	number(10,2);
begin 
	select  sum(sal) into v_sumsal
	from emp 
	where job = v_job;
	
	dbms_output.put_line('토탈 월급은: ' || v_sumsal);
end;
/

-> job도 같이 출력하려면 group by 절을 사용! 
set serveroutput on 
accept p_job prompt '직업을 입력하세요!'

declare 
	v_job  emp.job%type := '&p_job';
	v_sumsal	number(10,2);
begin 
	select  job, sum(sal) into v_job,v_sumsal
	from emp 
	where job = v_job
	group by job;
	
	dbms_output.put_line(v_job||'의 토탈 월급은: ' || v_sumsal);
end;
/

문제 3. 위의 코드를 수정해서 직업을 소문자로 입력해도 결과가 잘 출력될 수 있게 하시오. 
- 방법 1
set serveroutput on 
accept p_job prompt '직업을 입력하세요!'

declare 
	v_job  emp.job%type := '&p_job';
	v_sumsal	number(10,2);
begin 
	select  job, sum(sal) into v_job,v_sumsal
	from emp 
	where job = upper (v_job)
	group by job;
	
	dbms_output.put_line(v_job||'의 토탈 월급은: ' || v_sumsal);
end;
/

- 방법 2 -> 더 좋은 방법 (v_job이 여러번 쓰일 수도 있기 때문에) 
set serveroutput on 
accept p_job prompt '직업을 입력하세요!'

declare 
	v_job  emp.job%type := upper('&p_job');
	v_sumsal	number(10,2);
begin 
	select  job, sum(sal) into v_job,v_sumsal
	from emp 
	where job = v_job
	group by job;
	
	dbms_output.put_line(v_job||'의 토탈 월급은: ' || v_sumsal);
end;
/