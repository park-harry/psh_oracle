예제 1. 사원 테이블에 rnk(순위) 컬럼을 추가하시오
ALTER TABLE emp
ADD rnk NUMBER(10);

-- 예제2. 추가한 rnk 컬럼에 값을 해당 사원의 월급의 순위로 갱신하시오.
BEGIN
    FOR emp_record IN ( 
            SELECT empno, DENSE_RANK() OVER (ORDER BY sal desc) 순위
            FROM emp )
    LOOP
        UPDATE  emp
        SET   rnk = emp_record.순위
        WHERE empno = emp_record.empno;
    END LOOP;
    COMMIT;
END;
/

SELECT ename, rnk
FROM emp
ORDER BY rnk;

예제 2. rnk 컬럼 값을 모두 NULL 로 수정하기.
UPDATE emp
SET rnk = NULL;

예제3. 위의 코드를 패키지로 생성하시오.
- 명세부분 생성
CREATE OR REPLACE PACKAGE crank -- package 명
AS PROCEDURE crank_play;   -- procedure 명
END crank;
/

- 바디부분 생성
CREATE OR REPLACE PACKAGE BODY CRANK    -- package body. 명세부분의 package 명과 똑같아야 한다!
AS PROCEDURE crank_play    -- 명세부분에서 선언한 procedure 이름
IS
BEGIN
    FOR emp_record IN ( 
            SELECT empno, DENSE_RANK() OVER (ORDER BY sal desc) 순위
            FROM emp )LOOP
        UPDATE  emp
        SET   rnk = emp_record.순위
        WHERE empno = emp_record.empno;
    END LOOP;
    END crank_play; -- procedure 이름
END crank;  -- package 이름
/

- 패키지 실행 (EXECUTE 패키지이름.프로시저이름;)
EXECUTE crank.crank_play;

- 확인
SELECT ename, rnk
FROM emp
ORDER BY rnk;

문제 1. 아래의 함수를 패키지로 작성하시오
CREATE OR REPLACE FUNCTION fun179
( p_ename emp.ename%TYPE )
RETURN VARCHAR2
AS
    v_rank  NUMBER(5);
    v_msg   VARCHAR2(20);
BEGIN
    SELECT 순위 INTO v_rank
    FROM (SELECT ename, DENSE_RANK() OVER ( ORDER BY sal DESC ) 순위
            FROM emp )
    WHERE ename = UPPER(p_ename);
    
    IF v_rank < 4 THEN
        v_msg := '고소득';
    ELSE
        v_msg := '저소득';
    END IF;
    RETURN v_msg;
END;
/

- 답: 
- 명세부 작성 
CREATE OR REPLACE PACKAGE pcg_rank
AS FUNCTION fun179(p_ename emp.ename%TYPE) RETURN VARCHAR2;
END pcg_rank;
/
- 바디부 작성 
CREATE OR REPLACE PACKAGE BODY pcg_rank
AS FUNCTION fun179 (p_ename emp.ename%TYPE)
RETURN VARCHAR2
IS
    v_rank  NUMBER(5);
    v_msg   VARCHAR2(20);
BEGIN
    SELECT 순위 INTO v_rank
    FROM ( SELECT ename, DENSE_RANK() OVER ( ORDER BY sal DESC ) 순위
            FROM emp )
    WHERE ename = UPPER(p_ename);
    IF v_rank < 4 THEN
        v_msg := '고소득';
    ELSE
        v_msg := '저소득';
    END IF;
    RETURN v_msg;
END fun179;
END pcg_rank;
/

SELECT ename, sal, pcg_rank.fun179(ename) 소득
FROM emp;

문제 2. pcg_rank.fun179(ename) 을 사용해서 소득이 고소득인 사원의 이름과 월급과 소득 여부를 
출력하시오
select ename, sal, pcg_rank.fun179(ename)
from emp
where pcg_rank.fun179(ename) = '고소득';


문제 3. 아래의 함수를 패키지로 생성해서 아래와 같이 실행되게 하시오. 
create or replace package emp18_package
as function domain(p_ename emp18.ename%type) 
    return varchar2;
end emp18_package;
/

create or replace package body emp18_package 
as function domain(p_ename emp18.ename%type) return varchar2
is
    v_domain varchar2(50);
BEGIN
    select 도메인 into v_domain 
    from (select ename, substr(email, 
            instr(email,'@')+1, instr(email,'.')-instr(email,'@')-1) as 도메인
            from emp18) 
    where ename = p_ename;
    
    return v_domain;
    end domain;
end emp18_package;
/

select ename, email, emp18_package.domain(ename) 
from emp18;