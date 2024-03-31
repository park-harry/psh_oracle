RESULT CACHE 는 SQL과 PL/SQL의 성능 개선을 위한 오라클의 기술중 하나다. RESULT CACHE는 오라클 
메모리의 RESULT CACHE MEMORY 로 불리는 영역에 SQL 및 PL/SQL 함수의 결과를 저장하고, 이후 동일 
QUERY 조회 시 RESULT CACHE 에 저장 되어 있는 QUERY 결과 값을 그대로 활용하는 기능이다.

sqlplus에서 실행
실습 1. result cache 사용 안 했을 때
sqlplus c##scott/tiger
grant execute on dbms_lock to c##scott;

connect c##scott/tiger

create or replace function test_result_cache
( p_in in number )
return number
as
    begin
    dbms_lock.sleep(10);
    return( p_in );
end;
/

set timing on
select test_result_cache(7) from dual;

실습 2. result cache 사용 했을 때
create or replace function test_result_cache
( p_in in number )
return number
result_cache
as
    begin
    dbms_lock.sleep(10);
    return( p_in );
end;
/

select test_result_cache(7) from dual;
-- 처음에는 10초가 걸리지만 두번째부터는 결과가 바로 나온다. (메모리에 이미 저장이 되 있기 때문에)
select test_result_cache(7) from dual;

문제 1. 다음의 함수에 result cache 를 사용해서 성능이 높아지도록 하시오 !
CREATE OR REPLACE FUNCTION fun179
( p_ename emp.ename%TYPE )
RETURN VARCHAR2
result_cache
AS
    v_rank  NUMBER(5);
    v_msg   VARCHAR2(20);

BEGIN
    dbms_lock.sleep(1);    
    SELECT 순위 INTO v_rank
      FROM ( SELECT ename, DENSE_RANK() OVER ( ORDER BY sal DESC ) 순위
              FROM emp)
      WHERE ename = UPPER(p_ename);
    IF v_rank < 4 THEN
        v_msg := '고소득';    
    ELSE 
        v_msg := '저소득';   
    END IF;
    RETURN v_msg;
END;
/

SELECT ename, sal, fun179(ename) 소득
FROM emp
WHERE fun179(ename) = '고소득';

=> 1번째 실행: 14초 
=> 2번째 실행 : 1초 