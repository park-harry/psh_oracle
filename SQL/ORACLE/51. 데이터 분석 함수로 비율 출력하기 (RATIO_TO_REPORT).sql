-- �μ� ��ȣ 20���� ������� �����ȣ, �̸�, ����, ���޿� ���� ������ ����Ͻÿ�. 
// 1. ���� ������ ��ü ���� 
select empno, ename,  
round(sal/sum(sal) over(),2) as �񱳺���
from emp 
where deptno =20;

// 2.  ratio_to_report 
select empno, ename, sal, 
round(ratio_to_report(sal) over (),2) as ����
from emp 
where deptno = 20;