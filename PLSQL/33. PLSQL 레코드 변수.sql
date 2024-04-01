PL/SQL 레코드 생성 예제.
사원번호를 물어보게하고 사원번호를 입력하면 해당 사원의 사원이름, 월급과 직업이 출력되는 
PL/SQL 코드를 작성하시오. (월급은 9000으로 바꾸시오.) 

accept p_empno prompt '사원번호를 입력하세요 ~'
declare 
    v_empno  emp.empno%type := &p_empno;
    type t_rec is record (
        v_ename emp.ename%type,
        v_sal  emp.sal%type,
        v_job emp.job%type);
        v_myrec     t_rec;
begin
    select ename, sal, job into v_myrec
    from emp
    where empno = v_empno;

		v_myrec.v_sal := 9000;
    
    dbms_output.put_line(v_myrec.v_ename||'  '||v_myrec.v_sal||'  '||v_myrec.v_job);
end;
/

문제 1. 사원번호를 물어보게 하고 사원번호를 입력하면 해당 사원의 직업, 월급과 커미션이 출력되는 
PL/SQL 코드를 작성하는데 커미션은 무조건 0으로 출력되게 하시오.

accept p_empno prompt '사원번호를 입력하세요 ~'
declare 
    v_empno  emp.empno%type := &p_empno;
    type t_rec is record (
        v_job emp.job%type,
        v_sal  emp.sal%type,
        v_comm emp.comm%type);
        v_myrec     t_rec;
begin
    select job, sal, comm into v_myrec
    from emp
    where empno = v_empno;

    v_myrec.v_comm := 0;
    
    dbms_output.put_line('직업: '|| v_myrec.v_job);
    dbms_output.put_line('월급: '|| v_myrec.v_sal);
    dbms_output.put_line('커미션: '|| v_myrec.v_comm);

end;
/

문제 2. 학생들의 생일의 요일이 출력되게 하는 함수를 생성하시오. 
create or replace function func9
(p_birth emp18.birth%type) 
return varchar2 
as 
    v_birthdate varchar2(10);
begin
    select to_char(p_birth,'day') into v_birthdate
    from dual;
    
    return v_birthdate;
end;
/

select ename,func9(birth) as "태어난 요일"
from emp18;


create or replace function fun_domain
(p_email emp18.email%type)
return varchar2 
as 
    v_domain    varchar2(10);
begin
    select domain into v_domain
    from (select email, 
            substr(email,instr(email,'@')+1,instr(email,'.')- instr(email,'@')-1) as domain
            from emp18)
    where email = p_email;
    
    
    return v_domain;
end;
/

create or replace function fun_domain
(p_email emp18.email%type)
return varchar2 
as 
    v_domain    varchar2(10);
begin
    select substr(email,instr(email,'@')+1,instr(email,'.')- instr(email,'@')-1) into v_domain
    from emp18
    where email = p_email;
   
    return v_domain;
end;
/
        
select ename as 이름, email as 이메일, fun_domain(email) as 도메인 
from emp18;