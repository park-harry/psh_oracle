-- ���� ��¥�� �޿� ������ ��¥�� ����Ͻÿ�. 
select sysdate, last_day(sysdate)
from dual;

-- ���� ��¥���� �Ϸ縦 ���� ��¥�� ��¥�� ����ϰ� �� ���� �� ��¥�� ���� ������ ��¥�� ����Ͻÿ�.
select sysdate +1, last_day(sysdate +1)
from dual; 