
-�Լ��� ������� �ʾ��� ��:

SELECT  ename, sal, case when sal >= 3000 then  '��ҵ�'
when sal >= 2000 then  '�߰��ҵ�'
else  '���ҵ�'  end  "�ҵ�"
from  emp;

- �Լ��� ������� ��:
SELECT ename, sal, fun179(ename) �ҵ�
FROM emp;