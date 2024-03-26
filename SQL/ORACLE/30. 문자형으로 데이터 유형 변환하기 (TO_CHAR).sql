-- ���� ��¥�� ����ϰ� �� ���� ������ ������ ����Ͻÿ�. 
select sysdate, to_char(sysdate,'day')
from dual;

-- �츮 �� ���̺��� �̸�, ����, �¾ ������ ����Ͻÿ�. 
select ename, birth, to_char(birth,'day')
from emp18;

-- �ݿ��Ͽ� �¾ �л����� �̸��� ���ϰ� ������ ����Ͻÿ�. 
select ename, birth, to_char(birth,'day')
from emp18
where to_char(birth,'day') = '�ݿ���';

select ename, birth, to_char(birth,'day'), -- �ݿ���
to_char(birth,'dy'),  -- ��
to_char(birth,'d')   -- 6 (�Ͽ����� 1�� ���ؿ��� �ݿ����� 6) 
from emp18;

-- (7���� �������� ����) 
-- �̸�, ����, �¾ ���� ����ϴµ� ��ȭ��������� ������ �����ؼ� ����Ͻÿ�. 
select ename, birth, to_char(birth,'dy')
from emp18
order by to_char(birth-1,'d');

-- �̸�, �Ի���, �Ի��� �⵵, �Ի��� ��, �Ի��� ��, �Ի��� ������ ����Ͻÿ�. 
select ename, hiredate, to_char(hiredate,'YYYY'),
to_char(hiredate,'mm'),to_char(hiredate,'dd'),
to_char(hiredate,'day')
from emp;

-- 1981�⵵�� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�. 
-- like �� between .. and ��� ����, to_char �̿� 
select ename, hiredate 
from emp
where to_char(hiredate,'RRRR') = 1981;

-- �̸�, ������ ����ϴµ� ������ ����� �� õ ������ ǥ���Ͻÿ�. 
-- �����ǿ����� �ݵ�� �ٿ��� �Ѵ�. 
select ename, to_char(sal,'$999,999')
from emp;
select ename, to_char(sal,'L999,999')
from emp;
-- ���� 9�� �� �ڸ��� 0~9���� ��� ���ڰ� �͵� ��� ���ٴ� ���̴�. 
-- ���ĺ� L �� ���� ȭ�� ������. 

-- �̸�, ���� * 1020340 �� ����Ͻÿ�. (������ �� SQL �������) 
select ename, to_char(sal * 1020304,'L9,999,999,999')
from emp;