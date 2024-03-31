동적 SQL은 일반적으로 다음과 같은 상황에서 사용된다.
1. 테이블 이름 또는 열 이름이 런타임에 결정되는 경우:
=> SQL 쿼리의 대상이 되는 테이블이나 열 이름이 런타임에 결정되는 경우에는 동적 SQL이 필요하다.
=> "런타임" 의 뜻은  프로그램이 실행 중인 시간을 가리킨다.
	 동적 SQL을 사용하는 상황에서 "런타임"은 프로그램이 실행 중일 때, 즉 코드가 실행되고 
	 데이터베이스와 상호작용 할 때를 의미한다.
	 
2.동적인 테이블 생성 또는 스키마 변경:
=> DDL문: create, alter ,drop ,truncate, rename
=> PL/SQL 내에서 DDL 문장을 수행하는 경우 execute immediate을 사용한다.
=> 데이터베이스 객체를 생성, 수정 또는 삭제해야 하는 경우 동적 SQL이 필요 합니다.

3. 쿼리문을 동적으로 결정해야 하는 경우:
=> 테이블에 입력되어 있는 데이터에 따라서 쿼리문이 런타임시에 동적으로 구성되어야 할때 필요하다.

예제. 테이블 이름 또는 열 이름이 런타임에 결정되는 경우:
CREATE OR REPLACE PROCEDURE dynamic_table_query
IS
    v_result NUMBER;
    v_sql VARCHAR2(200);
BEGIN
    FOR table_rec IN (SELECT table_name FROM user_tables) LOOP
        v_sql := 'SELECT COUNT(*) FROM ' || table_rec.table_name;
        EXECUTE IMMEDIATE v_sql INTO v_result;
        DBMS_OUTPUT.PUT_LINE('테이블 ' || table_rec.table_name || '의 레코드 수: ' || v_result);
    END LOOP;
END;
/

exec dynamic_table_query;

문제 1. 위의 예제를 수정하여 테이블 이름이 E 로 시작하는 테이블들만 결과로 출력되게 코드를 
수정하시오.

CREATE OR REPLACE PROCEDURE dynamic_table_query
IS
    v_result NUMBER;
    v_sql VARCHAR2(200);
BEGIN
    FOR table_rec IN (SELECT table_name FROM user_tables where table_name like 'E%') LOOP
        v_sql := 'SELECT COUNT(*) FROM ' || table_rec.table_name;
        EXECUTE IMMEDIATE v_sql INTO v_result;
        DBMS_OUTPUT.PUT_LINE('테이블 ' || table_rec.table_name || '의 레코드 수: ' 
														|| v_result);
    END LOOP;
END;
/

exec dynamic_table_query;

문제 2. 위의 결과를 다시 출력하는데 테이블의 건수가 높은 것부터 출력되게 하시오. 
(E로 시작하는거 말고 전체 테이블) 
예제: 테이블 이름 또는 열 이름이 런타임에 결정되는 경우:
CREATE OR REPLACE PROCEDURE dynamic_table_query
IS
    v_result NUMBER;
    v_sql VARCHAR2(200);
BEGIN
    FOR table_rec IN (SELECT table_name FROM user_tables order by num_rows desc) LOOP
        v_sql := 'SELECT COUNT(*) FROM ' || table_rec.table_name;
        EXECUTE IMMEDIATE v_sql INTO v_result;
        DBMS_OUTPUT.PUT_LINE('테이블 ' || table_rec.table_name || '의 레코드 수: ' || v_result);
    END LOOP;
END;
/

exec dynamic_table_query;