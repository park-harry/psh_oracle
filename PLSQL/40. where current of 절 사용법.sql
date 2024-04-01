예제 1. emp 테이블에 grade 라는 컬럼을 추가하시오 !
alter  table  emp
add  grade  varchar2(10);

예제 2. emp 테이블에 grade 라는 컬럼에 다음의 조건에 해당되는 데이터로 값을 갱신하시오!
	월급이 3000 이상이면 A 등급
	월급이 2000 이상이면 B 등급
	월급이 1000 이상이면 C 등급
	나머지 월급은 D 등급으로  갱신
	

declare 
    cursor emp_cursor is  -- 커서 선언 
    select empno, ename, sal 
    from emp
    for update; 
=> 뒤에서 where current of 를 쓸려면 반드시 for update를 써줘야 한다. 
	 for update를 쓰면 다른 사람이 update 못하게 lock을 걸어 놓는거다. 
    emp_record       emp_cursor%rowtype;
    v_grade           emp.grade%type;

begin
    open emp_cursor; -- 커서 열기 
        loop 
            fetch emp_cursor into emp_record; -- 커서 패치 
            exit when emp_cursor%notfound;   
         
            if   emp_record.sal >= 3000  then
                  v_grade  := 'A';
            elsif    emp_record.sal >= 2000  then
                 v_grade := 'B';
            elsif     emp_record.sal >=1000   then
                 v_grade := 'C' ;
            else
                 v_grade  := 'D';
            end  if;

           update   emp
           set   grade = v_grade
           where   current  of   emp_cursor;	-- fetch 해온 행의 data		
        end loop;
        commit;
    close emp_cursor; -- 커서 닫기 
end;
/

문제 1. 방금 수행했던 문제를 프로시져로 만들어서 다음과 같이 직업을 입력하고 실행하면
해당 직업인 사원들의 데이터만 아래의 월급의 조건에 맞춰 grade 값이 갱신되게하시오.
update emp 
set grade = null;
commit;

create or replace procedure cursor_job
(p_job emp.job%type)
is
    cursor emp_cursor is  -- 커서 선언 
    select empno, ename, sal 
    from emp
    where job = p_job
    for update; 
    
    emp_record       emp_cursor%rowtype;
    v_grade           emp.grade%type;

begin
    open emp_cursor;
        loop 
            fetch emp_cursor into emp_record;
            exit when emp_cursor%notfound;   
            
            if   emp_record.sal >= 3000  then
                  v_grade  := 'A';
            elsif    emp_record.sal >= 2000  then
                 v_grade := 'B';
            elsif     emp_record.sal >=1000   then
                 v_grade := 'C' ;
            else
                 v_grade  := 'D';
            end  if;

           update   emp
           set   grade = v_grade
           where   current  of   emp_cursor;
        end loop;
        commit;
    close emp_cursor;
end;
/

exec  cursor_job('SALESMAN');