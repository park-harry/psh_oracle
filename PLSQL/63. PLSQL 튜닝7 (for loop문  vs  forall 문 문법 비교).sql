- for loop문 : 대량의 데이터를 1건씩 처리한다.
- forall 문 : 대량의 데이터를 한번에 처리한다.

for loop문과 forall loop문의 문법 비교
예제 1. 관련 테이블 생성
drop table test1 purge;
drop table test2 purge;

create table  test1 (c1 number);
create table  test2 (c1 number);

예제 2. for loop문을 사용한 프로시져 생성
=> 지금 만드는 프로시져는 test1 테이블에 숫자 1부터 100000까지 입력하는 프로시져. 
create or replace procedure  for_pro
is
begin
    for i in 1 .. 100000 loop
    insert /*+ FOR */ into test1 -- insert 문을 찾기 위해서 
    values (i);
    end loop;
end;
/
exec for_pro;

col sql_text for a20
SELECT sql_id, sql_text, executions, program_line#
FROM v$sql
WHERE sql_text LIKE 'INSERT /*+ FOR */%';
=> insert 문장을 검색 -> 10만번 수행한것이 나온다. 

예제 3. forall loop문을 사용한 프로시져 생성
create or replace procedure  for_all_pro
is
    type tnt is table of pls_integer;
    l_v1 tnt := tnt (); -- 초기화 
begin
    for i in 1 .. 100000 loop
        l_v1.extend; -- extend를 할때마다 한 줄씩 추가된다. 
        l_v1(i) := i; -- n 번째 요소에 n을 넣어라. 
    end loop;
    
    forall i in l_v1.first .. l_v1.last
        insert /*+ FOR_ALL */ into test2
        values (l_v1(i));
end;
/
exec for_all_pro;

col sql_text for a20
SELECT sql_id, sql_text, executions, program_line#
FROM v$sql
WHERE sql_text LIKE 'INSERT /*+ FOR_ALL */%';
=> 1번 수행한 것이 나온다. 

=> 두 프로시져의 수행 속도 차이 확인
set timing on 

exec for_pro;
exec for_all_pro;
set timing off
=> forall이 훨씬 빠르다. 

(복습문제) 
1. test1 테이블과 test2 테이블의 데이터를 truncate 하시오. 
truncate table test1;
truncate table test2;

2. 아래의 select 문장을 sqlplus에서 쉽게 돌릴수 있도록 script로 저장하시오. 
col sql_text for a20
SELECT sql_id, sql_text, executions, program_line#
FROM v$sql
WHERE sql_text LIKE 'INSERT /*+ FOR */%';