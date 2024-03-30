
���� 1. ������ ���̺��� �����Ͻÿ�. 
create table emp65
(empno number(10),
ename  varchar2(20),
loc varchar2(10) constraint emp65_loc_ck 
check (loc in ('DALLAS','CHICAGO','BOSTON')));

=> emp65 ���̺� loc Į���� ���� �Է� �Ǵ� ������ �� �μ���ġ�� 'DALLAS','CHICAGO','BOSTON'
	 �ܿ��� �Է� �Ǵ� ������ �� ���� �ȴ�. 

insert into emp65(empno, ename, loc)
values (1111,'scott','DALLAS'); 
=> insert �ȴ�. 

insert into emp65(empno, ename, loc)
values (2222,'allen','seoul'); 
=> üũ ���� ������ ����ǹǷ� insert ���� �ʴ´�. 

���� 2. ������ ���̺��� �����Ͻÿ�. 
- ���̺��: emp66
- �÷���: empno, ename, gender (������ ����, ���ڸ� �Է� �Ǵ� ���� �ǰ� üũ������ �Žÿ�.) 
create table emp66
(empno number(10),
ename varchar2(10),
gender varchar2(10) constraint emp66_gender_ck 
check (gender in ('����','����')));

���� 3. emp ���̺��� �μ���ȣ�� check ������ �Ŵµ� �μ���ȣ�� 10,20,30 �� �ܿ��� �Է� �Ǵ� 
�������� �ʵ��� üũ ������ �Žÿ�. 
alter table emp 
add constraint emp_deptno_ck check(deptno in (10,20,30));

���� 4-1. emp ���̺� sal�� üũ ������ �Ŵµ� ������ 0 ~ 9500 ������ �����͸� �Է� �Ǵ� 
�����ǰ� check ������ �Žÿ�. 
alter table emp 
add constraint emp_sal_ck check (sal between 0 and 9500);

���� 4-2. KING�� ������ 9600���� �����Ͻÿ�. 
update emp
set sal = 9600 
where ename  = 'KING';
=> üũ ���� ������ ����ǹǷ� update ���� �ʴ´�. 

���� 4-3. emp_sal_ck ������ ������Ű�ÿ�. (������ �ƴ�) 
alter table emp 
disable constraint emp_sal_ck;

���� 4-4. �� ���� ����� Ȯ���ϱ� 
select constraint_name, status 
from user_constraints 
where table_name = 'EMP';

���� 4-5. KING�� ������ 9600���� �����Ͻÿ�. 
update emp
set sal = 9600 
where ename  = 'KING'; 
=> ������ �����Ǿ����Ƿ� ���� UPDATE�� �ȴ�. 

���� 4-6. �ٽ� EMP_SAL_CK�� Ȱ��ȭ��Ű�ÿ�. 
alter table emp 
enable constraint emp_sal_ck;

=> ���࿡ ���ݵ� �����Ͱ� �־ ������ Ȱ��ȭ���� �ʴ´�. 

���� 4-7. ���࿡ ���ݵ� �����Ͱ� �ִ��� ������ Ȱ��ȭ ��Ű�� �ʹٸ� 
alter table emp 
enable novalidate constraint emp_sal_ck;

���� 5-1. �츮�� ���̺��� �̸� ������ ����Ѵ��� �ߺ��� �����ؼ� ����Ͻÿ�. 
select distinct substr(ename,1,1) 
from emp18;

���� 5-2. �츮�� ���̺� �̸��� check ������ �Ŵµ� ������ �츮���� �ִ� 19���� ���� �ܿ��� �Է� 
���� ���� ���ϵ��� üũ ������ �Žÿ�. 
alter table emp18 
add constraint emp18_ename_ck check (ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like '��%' or 
                                    ename like 'ȫ%'  );