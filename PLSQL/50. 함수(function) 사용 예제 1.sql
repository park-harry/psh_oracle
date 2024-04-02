- ����� ���� �Լ� ����
create  or  replace  function   �Լ��̸�
(�Էº���   ������ ����)
is | as
		return ��� ������ ����
begin
		���๮		
		return  ��º���;	
end;
/


����� ���� �Լ� ���� ���� 1.
�̸��� �Է�������, �ش� ����� ������ ������ ��µǰ��ϴ� �Լ��� �����Ͻÿ�.

create or replace function fun178
    (p_ename emp.ename%type)
    return number 
		as 
				v_rank number(5);
begin
    select ���� into v_rank
    from (select ename, dense_rank() over (order by sal desc) ���� 
            from emp)
    where ename = upper(p_ename);
    
    return v_rank;
end;
/

- ���Ȯ�� 
SELECT ename, sal, fun178(ename) ����
FROM emp
ORDER BY ����;

���� 1. ������ ������ ����� ���� �Լ� fun178�� �̿��ؼ� ��� ���̺��� ������ ������ 12���� 
����� �̸��� ������ ����Ͻÿ�. 
SELECT ename, sal, fun178(ename) ����
FROM emp
where fun178(ename) = 12
ORDER BY ����;

���� 2. ���� ����� ����� ���� �Լ� �̿����� ���� ����Ͻÿ�. 
select ename, sal 
from ( select ename, sal, dense_rank() over (order by sal desc) as ���� 
        from emp)
where ���� = 12;


����� ���� �Լ� ���� ���� 2.
���� �Լ��ڵ带 �����ؼ� �Ʒ��� ���� ����� ������ �Ͻÿ�.
	-> ��, ������ ������ 1 ~ 3������� ��ҵ�,
	-> ������ ������ ���ҵ� �̶� �۾��� ��µǰ� �ϴ� �Լ��� �����Ͻÿ�.

create or replace function fun179
(p_ename emp.ename%type) 
return varchar2
as 
    v_rank  number(10);
    v_msg   varchar2(20);
begin 
    select ���� into v_rank
    from (  select ename, dense_rank() over (order by sal desc) ���� 
            from emp )
    where ename = upper(p_ename);
    
    if v_rank <4 then 
        v_msg := '��ҵ�';
    else 
        v_msg := '���ҵ�';
    end if;
    
    return v_msg;
end;
/

- ���Ȯ�� 
SELECT ename, sal, fun179(ename) �ҵ�
FROM emp
order by �ҵ�;

���� 3. ������ ���� �Լ��� ����ؼ� ��ҵ��� ����� �̸��� ������ ����Ͻÿ� !
select ename, sal 
from emp 
where fun179(ename) = '��ҵ�';

���� 4. �ҵ��� ��ҵ����� ������� ����ϴµ� ������ 3000 �̻��� ����鸸 ����ϰ� ������ ���� ���
������ ��µǰ� �Ͻÿ�. 
select ename, sal 
from emp 
where fun179(ename) = '��ҵ�' and sal>=3000
order by sal desc;

���� 5. �츮�� ���̺��� ���̸� �Է��ϸ� ���̴밡 ��µǴ� �Լ��� �����Ͻÿ�. 
select ename, func3(age)
from emp18;

- ��: 
create or replace function func3 
(p_age emp18.age%type)
return varchar2 
as 
    v_agedae varchar2(10);
begin 
    select substr(p_age,1,1)||'0��' into v_agedae
    from dual;    
   
    return v_agedae;
end;
/

select ename, func3(age) as ���̴� 
from emp18;