-- 81�� 11�� 17�Ͽ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�. 
select ename, hiredate 
from emp
where hiredate ='1981/11/17';
-- ���� SQL �� ����ǿ� ���� �����ϸ� ������ ����. ���� ��¥ ������ ����� ��¥ �����̱� ����.
-- �����: ��/��/�⵵ 
-- �����: �⵵/��/��

-- ����� ȯ������ ��¥ ���� �����غ��� 
alter session set nls_date_format ='dd/mm/rr';

-- 81�� 11�� 17�Ͽ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�. 
select ename, hiredate 
from emp 
where hiredate = '17/11/81'; -- ����� ��� 
-- Ȯ���� ��� 
select ename, hiredate 
from emp 
where hiredate = to_date('1981/11/17','YYYY/mm/dd');

-- (SQL Ʃ��) Ʃ���� ������ �˻� �ӵ��� ������ ���ִ� ��� 
-- �Ʒ��� sql�� Ʃ���Ͻÿ�. (Ʃ�� ��)  
select ename, hiredate 
from emp 
where to_char(hiredate,'rrrr')='1981';
-- (Ʃ�� ��) 
select ename, hiredate 
from emp 
where hiredate between to_date('1981/1/1','YYYY/mm/dd') 
				    and to_date('1981/12/31','YYYY/mm/dd')+1;
-- 1981/01/01 0��0��0�� ~ 1981/12/31 0��0��0�� + �Ϸ� 

alter session set nls_date_format = 'yy/mm/dd';

select ename, hiredate 
from emp
where hiredate = '81/11/17';
-- yy�� �����س��� 2081������ �˻��ϱ� ������ ������� ������ �ʴ´�. 
-- �⵵�� 4�ڸ��� �ϰų� to_date('1981/11/17,'RR/MM/DD') �������� �ϸ� Ȯ���ϴ�.

select ename as �̸� , birth as ���� , trunc(months_between(sysdate,birth)/12) as ���� 
from emp18
where birth between to_date('1993/1/1','rr/mm/dd')and to_date('1998/12/31','rr/mm/dd')+1
order by ���� desc; 