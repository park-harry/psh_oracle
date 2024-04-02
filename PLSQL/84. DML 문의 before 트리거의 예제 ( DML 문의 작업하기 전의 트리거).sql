PL/SQL에서 안 배운 내용 2가지 
1. 트리거(trigger): 특정 조건이 발생했을 때 자동으로 특정 이벤트를 실행하는 db object 
   => 두 테이블 사이의 데이터를 서로 동기화 할 때 사용
   => OGG(Oracle Golden Gate) 의 기능 중에 데이터 동기화, 데이터 이행이 있다.
   => trigger 가 필요한 이유
     => dba 입장: 누군가가 우리 회사 인사 db(월급 테이블) 에 접속해서 자기의 월급을 300만원을 
						      900만원으로 갱신했다면 갱신한 행이 어떤 것이고 어떻게 갱신했으며 어느 컴퓨터 
						      자리에서 갱신했는지 이력을 특정 테이블에 입력되게 할 수 있다. 트리거를 이용하면
						      가능하다.
     => 개발자 입장: 영화를 예매하는 순간, 관련 데이터가 여러 개의 테이블에 동시에 입력이 되어서 
							      계산되고 합산되어서 총 매출액을 자동으로 출력하는 시스템을 만들 때 트리거가 
							      사용된다.
							      
2. 패키지 
    - PL/SQL 코드를 암호화 할 때 사용

※ 트리거의 종류
=> DML 문 트리거
  => before 트리거
  => after 트리거
  => instead of 트리거
=> DDL 문 트리거
=> DB 의 작업 (startup, shutdown) 을 위한 트리거
    
    
예제 1. 사원 테이블에 토요일과 일요일에 데이터 수정작업을 못하도록 트리거를 생성하시오 !
CREATE OR REPLACE TRIGGER secuer_emp
    BEFORE UPDATE ON emp
BEGIN
    IF ( TO_CHAR(SYSDATE, 'DY') IN ('토', '일', '목') ) THEN
    RAISE_APPLICATION_ERROR ( -20500, '토요일 일요일 목요일에 일하지 마세요' );
    -- 에러 번호는 2만번대 번호중 아무거나 써도 된다. 
    END IF;
END;
/

UPDATE emp
SET sal = sal * 2
WHERE ename = 'SCOTT';
=> 에러 나면 정상!

문제 1. 목요일에 사원 테이블을 delete 또는 insert 할 때 에러가 아래와 같이 출력되게 트리거를 
생성하시오 !

CREATE OR REPLACE TRIGGER tg_242
    BEFORE delete or insert ON emp
BEGIN
    IF ( TO_CHAR(SYSDATE, 'DY') =('목') ) THEN
    RAISE_APPLICATION_ERROR ( -20500, '사원 테이블에 아무런 작업을 하지 마세요' );
    END IF;
END;
/

INSERT INTO emp (ename)
VALUES ('SCOTT');

DELETE FROM emp
WHERE ename = 'SCOTT';

- 앞서 만든 trigger를 전부 drop 
drop trigger tg_242;
drop trigger secuer_emp;

문제2. 사원 테이블의 월급을 9000 이상으로 수정못하게 하는 트리거를 생성하시오.
create or replace trigger restrict_sal
    before update of sal on emp -- emp 테이블 전체가 아니라 특정 컬럼을 지정
    for each row  -- 특정 조건의 행만 갱신 못하게 할 수 있다. 
begin 
    if (:new.sal >= 9000) then -- :new.sal -> 새로운 들어오는 월급 이라는 뜻 
        raise_application_error(-20500, '9000 이상의 월급은 없다.');
    end if;
end;
/

update  emp 
set sal = 9000
where ename = 'SCOTT';
=> 에러 나면 정상. 

문제 3. 사원 테이블에 부서번호를 10번, 20번, 30번 외에는 다른 부서번호로는 갱신하지 못하게 
트리거를 생성하시오. 
create or replace trigger restrict_deptno
    before update of deptno on emp
    for each row
begin
    if (:new.deptno not in (10,20,30))then 
        raise_application_error(-20000,'10,20,30,외에 다른 부서번호로는 수정 불가');
    end if;
end;
/

update emp 
set deptno = 70 
where ename = 'KING';

- trigger drop 하기 
drop trigger restrict_deptno;