-- ���� ��¥ - �Ի����� �Ҽ��� ���Ĵ� ������ ����Ͻÿ�. 
select trunc(sysdate - hiredate)
from emp;

-- �츮 �� ���̺��� �̸��� ����ϰ� �¾ ��¥���� ���ñ��� �� �� �� ��Ҵ��� ����Ͻÿ�.
select ename, trunc((sysdate-birth)/7)
from emp18; 

-- �츮 �� ���̺��� �̸��� ����ϰ� �¾ ��¥���� ���ñ��� �� �� �� ��Ҵ��� ����Ͻÿ�.
select ename, trunc(months_between(sysdate,birth))
from emp18;

-- �׵��� ��ƿ� ���� 300�� �̻��� �л����� �̸��� ��ƿ� ���� ���� ����Ͻÿ�. 
select ename, trunc(months_between(sysdate,birth))
from emp18
where trunc(months_between(sysdate,birth)) >=300;

select ename, trunc((sysdate - birth)/365),
trunc(months_between(sysdate,birth)/12)
from emp18;

-- ������ �����δ� ���� ���̰� ������ ������ ����� ���� �ֱ� ������ 
-- months_between�� �� ��Ȯ�� ǥ���̴�. 

-- �츮 �� ���̺��� 1993��� 1998�⿡ �¾ �л����� �̸��� ���ϰ� ���̸� ����ϴµ� 
-- ���̰� ���� �л����� ����ϰ� column ���� �ѱ۷� �̸�, ����, ���̷� ����Ͻÿ�.
-- ��� ���� ������ ��ȸ�� �� �ֵ��� SQL�� �ۼ��Ͻÿ�. 
select ename as �̸�, birth as ����, age as ���� 
from emp18
where birth between to_date('1993/1/1','rr/mm/dd') and to_date('1998/12/31','rr/mm/dd')+1
order by age desc;