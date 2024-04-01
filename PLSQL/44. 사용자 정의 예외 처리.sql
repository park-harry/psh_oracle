PL/SQL 프로그램을 개발하다 보면 오라클이 제공하는 예외 만으로는 다양한 종류의 예외를 다 표현할 수
없다. 이때, 직접 예외를 정의하여 사용하는 예외를 사용자 정의 예외 라고 한다.

set  serveroutput on
accept   p_deptno  prompt  '부서번호를 입력하세요 ~ '
declare
    v_deptno    number :=  &p_deptno;
    e_invalid      exception;
begin
    update   dept
    set  dname ='testing'
    where  deptno = v_deptno; -- 0건의 행이 갱신되었다고 나오면 바로 exception 처리가 된다. 
    
    if  SQL%NOTFOUND  THEN
         raise  e_invalid;
    end  if;
    commit;

    exception
        when   e_invalid   then
        dbms_output.put_line('부서번호가 없어요');
end;
/

=> update문은 없는 데이터를 입력했다고 에러가 발생하지 않고 ‘0행이 업데이트 되었습니다’ 라고 한다.

문제 1. 이름을 물어보게하고 이름을 입력하면 해당 사원의 월급이 출력되는 PL/SQL 코드를 작성하시오.
그런데 월급이 3000 이상이면 '해당 사원의 월급은 볼 수 없습니다.' 라는 메세지가 출력되게 
사용자 정의 예외처리를 생성하시오.

set  serveroutput on
accept   p_ename  prompt  '이름을 입력하세요 ~ '
declare
    v_ename    emp.ename%type :=  upper('&p_ename');
    v_sal    emp.sal%type;
    e_invalid      exception;
begin
    select sal into v_sal
    from emp
    where  ename = v_ename;
    
    if  v_sal >=3000 THEN
         raise  e_invalid;
    end  if;
    
    dbms_output.put_line(v_ename||chr(9)||v_sal);
    commit;

    exception
        when   e_invalid   then
        dbms_output.put_line('해당 사원의 월급은 볼 수 없습니다.' );
end;
/