예외 트랩 함수: PL/SQL 프로그램에서 발생하는 오류 번호와 오류 메세지를 잡아내는 함수

예외트랩 함수의 종류 2가지
1. SQLCODE : PL/SQL에서 발생하는 에러 번호를 트랩(trap) 하는 함수
2. SQLERRM : PL/SQL에서 발생하는 에러 메세지를 트랩(trap) 하는 함수
    
환경 구성. 직업과 직업별 토탈월급을 저장할 테이블을 생성하시오.
create   table   daily_machul
(  job       varchar2(10),
sumsal    number(10) );

예제 1. 사원 테이블에서 직업과 직업별 토탈월급을 daily_machul 에 입력하는 프로시져를 생성하시오.
create or replace procedure daily_sum
is
begin
    insert into daily_machul
        select job, sum(sal)
        from  emp
        group by  job;       
    commit;
end;
/
exec  daily_sum;

에제 2. 프로시져를 수행했을때 오류가 나겠금 데이터를 수정한다.
update  emp
set  sal = 0
where  job='SALESMAN';

truncate  table   daily_machul;

alter   table  daily_machul
add   constraint   m_ck   check( sumsal  between  100  and   9000);

exec  daily_sum;

문제 1. 프로시져를 수행했을 때 발생하는 오류가 error 테이블에 입력되게 daily_sum 프로시져를 
수정한다.
create   table   error
(  e_date      timestamp,
e_code      number(10),
e_message     varchar2(200) );

create or replace procedure daily_sum
is
    e_code    number;
    e_message     varchar2(200);

begin
    insert   into    daily_machul
        select  job,  sum(sal)
        from  emp
        group by  job;
       commit;
       
       exception
        when   others     then -- others 가 모든 에러를 잡아낸다. 
        rollback;
        e_code := SQLCODE;
        e_message := SQLERRM;
        insert    into   error   values 
            ( systimestamp,  e_code, e_message );
end;
/

exec daily_sum;

문제 2. 위의 프로시져를 수행했을때 발생하는 에러 코드와 에러 메세지가 error 테이블에 입력됨과
동시에 출력도 되게 프로시져를 수정하세요
create or replace procedure daily_sum
is
    e_code    number;
    e_message     varchar2(200);

begin
    insert   into    daily_machul
        select  job,  sum(sal)
        from  emp
        group by  job;
       commit;
       
    exception
        when   others     then  -> others 가 모든 에러를 잡아낸다. 
        rollback;
        e_code := SQLCODE;
        e_message := SQLERRM;
        insert    into   error   values 
            ( systimestamp,  e_code, e_message );
        dbms_output.put_line('에러 메세지는: '||e_code||
                            '에러 번호:'||e_message);
end;
/

exec daily_sum;