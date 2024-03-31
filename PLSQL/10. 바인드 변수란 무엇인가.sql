바인드 변수는 호스트 환경에서 사용될 수 있어서 호스트 변수라고도 하는데 스타벅스에 가지고 갈 수 
있는 텀블러를 연상하면 된다. 호스트 환경은 PL/SQL블럭 외의 환경을 말한다.

1. 아래의 코드는 sqlplus 프롬프트 창에서 수행하시오. 
variable v_salary number 
=> 호스트 변수 

2.아래의 코드는 notepad++ 에 코딩하시오. 
begin
	select   sal  into   :v_salary => 바인드 변수, 앞에 : 을 써줘야 한다. 
	from   emp
	where   empno = 7788;
end;
/

3. 아래의 코드는 sqlplus 프롬프트 창에서 수행하시오
print  v_salary
=>:(콜론) 은 begin과 end 사이에만 붙여준다. 

select  ename, sal
from  emp
where sal = :v_salary;
- 바인드변수(호스트 변수)를 PL/SQL 블럭과 SQL에서 사용하려면 콜론(:) 을 앞에 붙여줘야 한다.
- 바인드 변수 선언시  숫자 변수는  number 로 써야하고 number(10) 으로 하면 오류가 난다.
- 문자인 varchar2 는 varchar2(10) 로 해야 된다.


문제 1. 아래의 코드를 실행하는데 autoprint 기능을 켜고 실행하시오
1. 아래의 코드는 sqlplus 프롬프트 창에서 수행하시오
variable v_salary number
set autoprint on

아래의 코드는 notepad++ 에 코딩하시오.
declare
		v_empno    number(6) := &empno;
begin
		select   sal  into   :v_salary
		from   emp
		where   empno = v_empno;
end;
/

위의 코드를 활용해서 다음과 같이 수행되게 하시오
	ename의 값을 입력하세요 ~   SCOTT
	ANALYST
	
variable v_job varchar2(10)
set autoprint on

declare 
	v_ename emp.ename%type := '&ename';
begin 
	select job into :v_job
	from emp 
	where ename = v_ename;
end;
/

=> autoprint 상태 
show autoprint 

set autoprint off 