���� 1. ������ �Ի��� �⵵�� ��Ż������ ����Ͻÿ� !
select  job,  sum( decode( to_char(hiredate, 'RRRR'), '1980' , sal, null)  )  as "1980",
							sum( decode( to_char(hiredate, 'RRRR'), '1981' , sal, null)  )  as "1981",
							sum( decode( to_char(hiredate, 'RRRR'), '1982' , sal, null)  )  as "1982",
							sum( decode( to_char(hiredate, 'RRRR'), '1983' , sal, null)  )  as "1983"
from  emp
group by  job;

���� 2. �μ���ȣ�� �Ի��� �⵵�� ��Ż������ ����ϼ���.
select  deptno,  sum( decode( to_char(hiredate, 'RRRR'), '1980' , sal, null)  )  as "1980",
                sum( decode( to_char(hiredate, 'RRRR'), '1981' , sal, null)  )  as "1981",
                sum( decode( to_char(hiredate, 'RRRR'), '1982' , sal, null)  )  as "1982",
                sum( decode( to_char(hiredate, 'RRRR'), '1983' , sal, null)  )  as "1983"
from  emp
group by  deptno;