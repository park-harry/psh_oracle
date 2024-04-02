instead of trigger 를 사용하는 이유
=> 복합뷰에 data를 입력하기 위해서 사용한다.
=> view 의 종류 2가지
  => 단순 view
    => table 1개
    => 그룹함수 group by 절 포함 안함
    => DML 사용 여부가 가능하다.
  => 복합 view
    => table 2개 이상
    => 그룹함수 group by 절 포함
    => DML 사용 여부가 불가능 할 수도 있다.
    
예제 1. DALLAS 에서 근무하는 사원들의 이름과 월급과 부서위치와 부서번호를 출력하는 복합뷰를 
생성하시오 ! (VIEW 이름은 emp252)
CREATE OR REPLACE VIEW emp252
AS
    SELECT  e.empno, e.ename, e.sal, d.loc, d.deptno
    FROM emp e, dept d
    WHERE e.deptno = d.deptno
    AND d.loc = 'DALLAS';

SELECT *
FROM emp252;

예제 2.  emp252 view 의 SMITH 의 월급을 5000 으로 수정하시오!
update emp252 
set sal = 5000 
where ename = 'SMITH';

=> 19c 까지는 view update이 에러가 나고 21c부터는 에러가 나지 않는다.  

예제 3. 아래의 문구를 수행하시오. 
insert into emp252 (empno, ename, sal, loc)
values(9999,'JANE',3000,'DALLAS');

=> 위의 insert문은 21c도 안된다. 

select * from v$version;
=> sql 버전 보는 방법 


예제 4. 사원번호, 이름, 월급, 부서번호, 부서명을 출력하는 view 를 생성하시오 !
CREATE VIEW emp255
AS
    SELECT e.empno, e.ename, e.sal, e.deptno, d.dname
    FROM emp e, dept d
    WHERE e.deptno = d.deptno;

select * from emp255;

예제 5. 아래의 문구가 실행될 수 있도록 intead of 트리거를 생성하시오. 
create or replace trigger emp_dept_insert
instead of insert on emp255
referencing new as n -- NEW 를 N 으로 별칭해줌.
for each row
declare
dept_cnt number;
begin
    if :n.empno is not null then
    insert into emp(empno, ename, sal, deptno)
    values (:n.empno, :n.ename, :n.sal, :n.deptno);
    end if;
    
    if :n.deptno is not null then
    select count(*) into dept_cnt
    from dept where deptno = :n.deptno;
    
    if dept_cnt > 0 and (:n.dname is not null) then
            update dept set dname = :n.dname where deptno = :n.deptno;
    else insert into dept(deptno, dname) values(:n.deptno, :n.dname);
    end if;
    end if;
end;
/

INSERT INTO emp255 (empno, ename, sal, deptno, dname)
VALUES (8999, 'EYKIM', 4000, 10, 'HR');

SELECT *
FROM emp255;