-- ���� ��¥���� �ٷ� ���ƿ��� �������� ��¥�� ����Ͻÿ�. 
select next_day(sysdate,'������')
from dual;

-- ���ú��� 100�� �ڿ� ���ƿ��� �������� ��¥�� ����Ͻÿ�. 
select next_day(sysdate +(interval '100' month),'������')
from dual;

select next_day(add_months(sysdate,100),'������')
from dual;

-- ���ú��� 100�� �ڿ� ���ƿ��� �������� ��¥�� ����Ͻÿ�. 
select next_day( add_months(sysdate,100*12),'������')
from dual;
-- interval�δ� 99���� �ۿ� �ȵȴ�. 