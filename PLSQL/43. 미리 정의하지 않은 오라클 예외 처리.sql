※ 오라클에서 미리 정의 하지 않은 예외 처리 인 경우는 직접 예외 처리를 해야 하는데 
pragma  exception_init를 이용해서 예외 처리 하면 된다. 

- 오라클에서 미리 정의하지 않은 예외처리
1. emp 와 dept 를 초기화 한다.
@demo.sql

2. dept 테이블에 loc 컬럼에 not null 제약을 건다.*/
alter  table  dept
modify   loc  not  null;

3. dept 테이블에 데이터를 입력하는 PL/SQL 프로그램을 작성한다.
accept  p_deptno  prompt  '부서번호를 입력하세요~ '
accept  p_dname   prompt  '부서명을 입력하세요~ '
accept  p_loc     prompt  '부서위치를 입력하세요~ '
begin
    insert into  dept
    values(&p_deptno, '&p_dname', '&p_loc');	
    commit;
end;
/

4. loc에 null 값을 입력해본다. 
부서번호를 입력하세요~ 70
부서명을 입력하세요~ hr2
부서위치를 입력하세요~

5. 예외처리를 한다.
accept  p_deptno  prompt  '부서번호를 입력하세요~ '
accept  p_dname   prompt  '부서명을 입력하세요~ '
accept  p_loc     prompt  '부서위치를 입력하세요~ '
declare 
    e_insert_except exception;
    pragma exception_init(e_insert_except, -01400);
begin
    insert into  dept
    values(&p_deptno, '&p_dname', '&p_loc');	
    commit;
    
    exception 
        when e_insert_except then 
            dbms_output.put_line('부서위치를 입력하지 않았습니다. 부서위치를 입력하시오.' );
end;
/

문제 1. 
1-1.emp 테이블에 empno 컬럼에 중복된 데이터가 입력되지 못하게 primary key 제약을 거시오.
demo script 한번 돌려주고 푸시오. 
@demo
alter  table  emp
add  constraint  emp_empno_pk primary  key(empno);

1-2. emp 테이블에 데이터를 입력하는 아래의 PL/SQL 프로그램을 작성하시오
accept   p_empno prompt  '사원번호를 입력하세요~ '
accept  p_ename   prompt  '사원이름을 입력하세요~ '
accept  p_sal     prompt  '월급을 입력하세요~ '
begin
    insert into  emp(empno, ename, sal)
    values(&p_empno, '&p_ename',  &p_sal );	
    commit;
end;
/
1-3. empno 에 중복된 사원 번호를 입력했을 때 '해당 사원번호는 기존에 존재합니다.' 라는 메세지가 
출력되게 하시오 !
accept   p_empno prompt  '사원번호를 입력하세요~ '
accept  p_ename   prompt  '사원이름을 입력하세요~ '
accept  p_sal     prompt  '월급을 입력하세요~ '
declare 
    e_insert_except exception;
    pragma exception_init(e_insert_except, -1);
begin
    insert into  emp(empno, ename, sal)
    values(&p_empno, '&p_ename',  &p_sal );	
    commit;
    exception
        when e_insert_except then 
            dbms_output.put_line('해당 사원번호는 기존에 존재합니다.');
end;
/