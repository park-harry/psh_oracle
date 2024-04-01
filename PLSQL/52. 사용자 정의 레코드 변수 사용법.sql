PL/SQL 변수의 종류 3가지
1. 스칼라 변수
2. 조합 변수
3. 바인드 변수

예제.  
select ename, sal, deptno 
from emp 
where deptno = &deptno; -> 치환변수 

select ename, sal, deptno 
from emp 
where deptno = : deptno; -> 바인드 변수 


조합 변수의 종류 2가지
1. record
=> 사용자 정의 레코드 변수
=> %rowtype
2. collection
=> 연관 배열
   => 키와 값으로 구성된 collection
=> varray:
   => 연관 배열처럼 키와 값으로 이루어진 컬렉션 변수다. varray 는 담아낼 데이터의 행의 개수를
	    처음부터 지정해야 한다. 그리고 변수를 반드시 초기화 해야 한다.
=> 중첩 테이블
   => 하나 이상의 값을 저장할 수 있는 컬렉션 데이터 유형 중 하나다.
   => 연관 배열과 varray와의 다른 점은 중첩 테이블을 테이블 전체의 데이터를 담을 수 있는 변수라는
	    것이다.
   
   
사용자 정의 레코드 변수 사용법
사원번호를 입력해서 프로시져를 수행하면 해당 사원의 이름과 월급과 직업이 출력되게 하시오.
create or replace  procedure  pro1
(p_empno  emp.empno%type )
is
    type   t_rec   is   record
    (ename   emp.ename%type,
    sal       emp.sal%type,
    job       emp.job%type  );
v_myrec     t_rec ;
begin  
    select   ename, sal, job  into   v_myrec
    from  emp
    where  empno =  p_empno;
    
    dbms_output.put_line ( v_myrec.ename ||chr(9)||
                            v_myrec.sal ||chr(9) ||
                            v_myrec.job) ;
end;
/

set serveroutput on
exec pro1(7788);

문제 1. 이름을 입력해서 프로시져를 실행하면 해당 사원의 이름과 월급과 직업이 출력되게하는 
프로시져를 생성하세요.
create or replace  procedure  pro_ename
(p_ename  emp.ename%type )
is
    type   t_rec   is   record
    (ename   emp.ename%type,
    sal       emp.sal%type,
    job       emp.job%type  );
v_myrec     t_rec ;
begin  
    select   ename, sal, job  into   v_myrec
    from  emp
    where  ename =  p_ename;
    
    dbms_output.put_line ( v_myrec.ename ||chr(9)||
                            v_myrec.sal ||chr(9) ||
                            v_myrec.job) ;
end;
/

set serveroutput on
exec pro_ename('SCOTT');