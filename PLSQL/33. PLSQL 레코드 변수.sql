PL/SQL ���ڵ� ���� ����.
�����ȣ�� ������ϰ� �����ȣ�� �Է��ϸ� �ش� ����� ����̸�, ���ް� ������ ��µǴ� 
PL/SQL �ڵ带 �ۼ��Ͻÿ�. (������ 9000���� �ٲٽÿ�.) 

accept p_empno prompt '�����ȣ�� �Է��ϼ��� ~'
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

���� 1. �����ȣ�� ����� �ϰ� �����ȣ�� �Է��ϸ� �ش� ����� ����, ���ް� Ŀ�̼��� ��µǴ� 
PL/SQL �ڵ带 �ۼ��ϴµ� Ŀ�̼��� ������ 0���� ��µǰ� �Ͻÿ�.

accept p_empno prompt '�����ȣ�� �Է��ϼ��� ~'
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
    
    dbms_output.put_line('����: '|| v_myrec.v_job);
    dbms_output.put_line('����: '|| v_myrec.v_sal);
    dbms_output.put_line('Ŀ�̼�: '|| v_myrec.v_comm);

end;
/

���� 2. �л����� ������ ������ ��µǰ� �ϴ� �Լ��� �����Ͻÿ�. 
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

select ename,func9(birth) as "�¾ ����"
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
        
select ename as �̸�, email as �̸���, fun_domain(email) as ������ 
from emp18;