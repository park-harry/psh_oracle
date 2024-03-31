- 하나의 일을 혼자서 하는게 아니라 여러 프로세서들이 나눠서 같이 동시에 작업하는 것을 병렬 작업
	이라고 한다. 그런데 PL/SQL 함수를 생성할 때 parallel_enabled 옵션을 사용하게 되면 함수를 
	실행할 때 병렬로 작업을 해서 성능을 높일 수 있다.
	
- 먼저 병렬 처리가 지원이 되려면 오라클 프로그램이 어떤 건지 확인해야 한다.
  => express edition은 병렬이 되지 않는다. 아래의 코드로 edition 확인
		
		select * from  v$version;

실습.
- 함수(싱글처리) -> 싱글 처리는 이 함수를 실행하는 프로세서가 1개라는 것이다. 
create or replace function func_s
(p_val number)
return number
is
    v_ret number;
begin
    select dbms_random.value(1, p_val) into v_ret
    from dual;
    
    return v_ret;
end;
/

- 함수 (병렬처리)
create or replace function func_p
(p_val number)
return number
parallel_enable
is
    v_ret number;
begin
    select dbms_random.value(1, p_val) into v_ret
    from dual;
    
    return v_ret;
end;
/

- 테스트 테이블 생성 
drop  table test1;

create table  test1
as
select empno, salary, deptno,
    lpad(ename, 5, ename) as ename,
    lpad(addr, 5, addr) as addr
    from ( select level + 10000000 as empno,
        mod(level,1000) + 10000 as salary,
        mod(level,20) as deptno,
        chr(97+mod(level,26)) as ename,
        chr(65+mod(level,26)) as addr
        from dual
        connect by level <= 2000000
        );

set timing on

select /*+ parallel(10) */ avg(hash_val)
from (select func_s(empno) as hash_val
    from TEST1
    );
=> parallel(10)을 주면 병렬작업을 하지만 func_s는 싱글처리라서 병렬처리를 하지 않는다. 

select /*+ parallel(10) */ avg(hash_val)
from (
select func_p(empno) as hash_val
from TEST1
);

show parameter cpu_count 
=> cpu_count 나오는 숫자의 2배만큼 병렬을 할 수 있다. 

문제 1. 아래의 func179 함수를 병렬로 수행할 수 있도록 옵션을 주고 병렬로 실행하시오. 
CREATE OR REPLACE FUNCTION fun179
( p_ename emp.ename%TYPE )
RETURN VARCHAR2
parallel_enable
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

SELECT /*+ parallel(10) */ ename, sal, fun179(ename) 소득
FROM emp
WHERE fun179(ename) = '고소득';

문제 2. 위의 sql을 다시 수행하는데 병렬도를 16을 주고 실행하시오. 
SELECT /*+ parallel(16) */ ename, sal, fun179(ename) 소득
FROM emp
WHERE fun179(ename) = '고소득';