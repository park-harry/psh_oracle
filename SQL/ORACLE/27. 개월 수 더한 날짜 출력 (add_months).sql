-- ���� ��¥���� 3���� ���� ��¥�� ����Ͻÿ�. 
select sysdate + 3
from dual; 

-- ���� ��¥���� 3�� ���� ��¥�� ����Ͻÿ�. 
select add_months(sysdate,3)
from dual;

-- ���� ��¥���� 3�� �� ��¥�� ����Ͻÿ�.
select sysdate +(interval '3' year)
from dual; 

-- �̸� �̰� ���� �̰�, ���Ͽ��� 50���� ���� ��¥�� ����Ͻÿ�. 
alter session set nls_date_format = 'YYYY/MM/DD';
--  ������ session(â)���� �⵵�� 4�ڸ��� �ٲ��ش�. â�� �����ϸ� �ٽ� ������� ���ƿ´�. 
select ename, birth, birth + (interval '50' year)
from emp18;