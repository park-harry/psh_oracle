
문제 1. 다음의 테이블을 생성하시오. 
create table emp65
(empno number(10),
ename  varchar2(20),
loc varchar2(10) constraint emp65_loc_ck 
check (loc in ('DALLAS','CHICAGO','BOSTON')));

=> emp65 테이블에 loc 칼럼에 값을 입력 또는 갱신할 때 부서위치가 'DALLAS','CHICAGO','BOSTON'
	 외에는 입력 또는 수정할 수 없게 된다. 

insert into emp65(empno, ename, loc)
values (1111,'scott','DALLAS'); 
=> insert 된다. 

insert into emp65(empno, ename, loc)
values (2222,'allen','seoul'); 
=> 체크 제약 조건이 위배되므로 insert 되지 않는다. 

문제 2. 다음의 테이블을 생성하시오. 
- 테이블명: emp66
- 컬럼명: empno, ename, gender (성별이 남자, 여자만 입력 또는 수정 되게 체크제약을 거시오.) 
create table emp66
(empno number(10),
ename varchar2(10),
gender varchar2(10) constraint emp66_gender_ck 
check (gender in ('남자','여자')));

문제 3. emp 테이블의 부서번호에 check 제약을 거는데 부서번호가 10,20,30 번 외에는 입력 또는 
수정되지 않도록 체크 제약을 거시오. 
alter table emp 
add constraint emp_deptno_ck check(deptno in (10,20,30));

문제 4-1. emp 테이블에 sal에 체크 제약을 거는데 월급이 0 ~ 9500 사이의 데이터만 입력 또는 
수정되게 check 제약을 거시오. 
alter table emp 
add constraint emp_sal_ck check (sal between 0 and 9500);

문제 4-2. KING의 월급을 9600으로 수정하시오. 
update emp
set sal = 9600 
where ename  = 'KING';
=> 체크 제약 조건이 위배되므로 update 되지 않는다. 

문제 4-3. emp_sal_ck 제약을 중지시키시오. (삭제가 아님) 
alter table emp 
disable constraint emp_sal_ck;

문제 4-4. 잘 중지 됬는지 확인하기 
select constraint_name, status 
from user_constraints 
where table_name = 'EMP';

문제 4-5. KING의 월급을 9600으로 수정하시오. 
update emp
set sal = 9600 
where ename  = 'KING'; 
=> 제약이 중지되었으므로 이제 UPDATE가 된다. 

문제 4-6. 다시 EMP_SAL_CK를 활성화시키시오. 
alter table emp 
enable constraint emp_sal_ck;

=> 제약에 위반된 데이터가 있어서 제약이 활성화되지 않는다. 

문제 4-7. 제약에 위반된 데이터가 있더라도 제약을 활성화 시키고 싶다면 
alter table emp 
enable novalidate constraint emp_sal_ck;

문제 5-1. 우리반 테이블에서 이름 성씨를 출력한느데 중복을 제거해서 출력하시오. 
select distinct substr(ename,1,1) 
from emp18;

문제 5-2. 우리반 테이블에 이름의 check 제약을 거는데 성씨가 우리반의 있는 19개의 성씨 외에는 입력 
수정 되지 못하도록 체크 제약을 거시오. 
alter table emp18 
add constraint emp18_ename_ck check (ename like '강%' or 
                                    ename like '김%' or 
                                    ename like '나%' or 
                                    ename like '남%' or 
                                    ename like '노%' or 
                                    ename like '류%' or 
                                    ename like '박%' or 
                                    ename like '서%' or 
                                    ename like '손%' or 
                                    ename like '염%' or 
                                    ename like '오%' or 
                                    ename like '유%' or 
                                    ename like '이%' or 
                                    ename like '전%' or 
                                    ename like '정%' or 
                                    ename like '진%' or 
                                    ename like '최%' or 
                                    ename like '하%' or 
                                    ename like '홍%'  );