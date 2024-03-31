set  serveroutput  on
accept   p_empno  prompt  '사원번호를 입력하세요 ~'
declare
		v_sal     emp.sal%type ;
begin
		select   sal   into   v_sal
		from   emp
		where  empno = &p_empno;
		
		dbms_output.put_line('해당 사원의 월급은 ' || v_sal );
end;
/

=> emp.sal % type → emp table의 sql에 data type을 그대로 따르겠다.
=> 변수의 데이터 유형을 지정할 때 emp.sal%type 이라고 하게 되면 가장 큰 장점이 emp 테이블의 
	월급의 데이터 유형의 크기가 변경이 되었을 때 pl/sql 코드를 따로 변경해주지 않아도 된다.
	
예제 1. 
만약에 아래와 같이 개발자가 PL/SQL 코딩을 했다면? 
set  serveroutput  on
	accept   p_empno  prompt  '사원번호를 입력하세요 ~'
declare
		v_sal     number(10) ;
begin
		select   sal   into   v_sal
		from   emp
		where  empno = &p_empno;

dbms_output.put_line('해당 사원의 월급은 ' || v_sal );
end;
/

그런데 어느날 dba 가 아래와 같이 emp 테이블의 sal을 변경했다.
alter   table   emp
modify    sal   number(15);

=> 이렇게 크기를 늘리면  db에 sal과 관련된 PL/SQL 프로그램의 변수의 데이터 유형을number(10)에서
	number(15) 로 변경해줘야 한다. 그러면 수많은 프로그램 코드를 다 변경 해줘야 하는 번거로움이
	생긴다. 그래서 아예 처음부터 PL/SQL 코딩할 때 다음과 같이 코딩 해야 한다.
	
set  serveroutput  on
	accept   p_empno  prompt  '사원번호를 입력하세요 ~'
declare
	v_sal     emp.sal%type;
begin
	select   sal   into   v_sal
	from   emp
	where  empno = &p_empno;
	
	dbms_output.put_line('해당 사원의 월급은 ' || v_sal );
end;
/

위의 코드를 수정해서 사원번호를 물어보게하고 사원번호를 입력하면 이번에는 월급과 직업도 같이 
출력되게하시오
구현결과:
	사원번호를 입력하세요 ~    7788                
	해당사원의 월급은 3000
	해당사원의 직업은  ANALYST

set  serveroutput  on
	accept   p_empno  prompt  '사원번호를 입력하세요 ~'
declare
	v_sal     emp.sal%type;
	v_job 	  emp.job%type;
begin
	select   sal,job   into   v_sal, v_job
	from   emp
	where  empno = &p_empno;

dbms_output.put_line('해당 사원의 월급은 ' || v_sal );
dbms_output.put_line('해당 사원의 월급은 ' || v_job );
end;
/

문제 2. 다음과 같이 사원번호를 물어보게 하고 사원번호를 입력하면 해당 사원의 이름과 월급이 다음과 
같이 출력되게 하시오. 
	사원번호를 입력하세요: 7788
	SCOTT의 월급은 3000입니다.
	
set serveroutput on 
accept p_empno prompt '사원번호를 입력하시오. '

declare 
        v_ename emp.ename%type;
        v_sal  emp.sal%type;
begin
        select ename, sal into v_ename,v_sal
        from emp 
        where empno = &p_empno;
        
        dbms_output.put_line(v_ename ||'의 월급은 '||v_sal||'입니다.');
end;
/

문제 3. 다음과 같이 이름을 물어보게하고 이름을 입력하면 해당 사원의 이름과 월급과 직업이 
출력되게 하시오.
		이름을 입력하세요: SCOTT
		SCOTT 의 월급은 3000 이고 직업은 ANALYST 입니다.
		
set serveroutput on 
set verify off
accept p_ename prompt '이름을 입력하세요~'

declare 
    v_ename emp.ename%type;
    v_sal emp.sal%type;
    v_job emp.job%type;

begin 
    select ename, sal, job into v_ename, v_sal,v_job
    from emp 
    where ename = '&p_ename';

    dbms_output.put_line(v_ename||'의 월급은 '||v_sal||' 이고 직업은 '||v_job||'입니다.');
end;
/