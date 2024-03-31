1. 첫 번째 주의 사항
declare
v_num    number(10)  not  null ;    <-- X
v_num    number(10)  not  null  :=  0 ;   <-- O
v_num2   constant   ;  <--- X, constant : 상수 
v_num2   constant  := 120 ;  <--- O
v_num3    varchar2(10)   default   'john' ;   <--- O


2. 두 번째 주의 사항
select   ... into 절 변수명 지을때 해당 테이블의 컬럼명으로 만들면 안 된다.

예제 1. 두 번째 주의사항을 확인하기 위해서 다음의 코드를 이해하세요.
set  serveroutput  on
accept   p_empno  prompt  '사원번호를 입력하세요 ~'
declare
		v_sal     number(10) ;
begin
		select   sal   into  v_sal
		from   emp
		where  empno = &p_empno;

		dbms_output.put_line('해당 사원의 월급은 ' || v_sal );
end;
/

예제 2. 위의 코드의 v_sal  변수명을  sal 이라고 수정해서 실행하면 실행되는지 확인하시오 !
set  serveroutput  on
accept   p_empno  prompt  '사원번호를 입력하세요 ~'
declare
		sal     number(10) ;
begin
		select   sal   into  sal
		from   emp
		where  empno = &p_empno;

dbms_output.put_line('해당 사원의 월급은 ' || sal );
end;
/ 

=> 에러가 나지는 않는다. 하지만 가독성 면에서 크게 떨어지기 때문에 앞에 v_ 또는 p_ 를 꼭 붙여줘야 
	 된다. 

문제 1. 사원 번호를 물어보게 하고 사원번호를 입력하면 해당 사원이 직업이 출력되게 하시오. 
set  serveroutput  on
accept   p_empno  prompt  '사원번호를 입력하세요 ~'
declare
		v_job     varchar2(10) ;
begin
		select   job   into  v_job
		from   emp
		where  empno = &p_empno;

		dbms_output.put_line('해당 사원의 직업은 ' || v_job );
end;
/