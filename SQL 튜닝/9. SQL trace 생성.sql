※ SQL trace생성하기
1. 시간 정보가 SQL trace에 포함될 수 있도록 설정
alter session set timed_statistics = true;

2. 생성되는 trace file의 제한을 주지 않게 설정
alter session set max_dump_file_size = unlimited;

3. 10046 트레이스 이벤트를 활성화 한다.(오라클 7.3 이상)
alter session set events '10046 trace name context forever, level 12';

=> level 을 12까지 줄수 있다.  8보다는 더 많은 정보가 출력된다.

4. 튜닝이 필요한 SQL을 실행합니다.
select /*+ full(emp) */  ename, sal
from  emp
where  ename='SCOTT';

select empno, ename, sal, job 
from emp 
where job = 'SALESMAN';

select ename,  job, mgr
from emp 
where deptno= 10;

5. 트레이스를 중단한다
alter session set events '10046 trace name context off';


6. user trace file 생성되는 위치 변경하기 (위의 2번과 3번 사이) 
6-1. sys 유저로 접속해서 위치 확인한다. 
sqlplus sys/oracle_4U as sysdba
    
show parameter user_dump_dest
    
6-2. user_dump_dest의 위치를 다른 위치로 변경한다 
alter system set user_dump_dest ='D:\oracle2\diag\rdbms\xe\xe\trace' scope=spfile; 

=> 파일명은 컴퓨터마다 다르다

startup force

6-3. 위치 확인 
show parameter user_dump_dest

D:\oracle2\diag\rdbms\xe\xe\trace
- 윈도우 탐색기를 열고 위의 위치로 이동한다.
- 날짜순으로 정렬하고 맨 마지막에 생성된 trace file 열기
- 파일 이름 복사 → xe_dia0_11688.trc
- 드라이브에 trace 폴더 따로 만들고 위의 파일 복사하기
- 명령 프롬포트 창에서 ‘cd ..’ 를 눌러서 C 또는 D 드라이브까지 간다.
- dir → cd trace

7. 관련 트레이스 파일을 보기쉽게 보는 방법
(os)
tkprof explain=c##scott/tiger  sys=no
trace =xe_dia0_11688.trc
result= result01.txt

문제 1. 위와같이 SQL trace 를 뜨는것을 빠르고 쉽게 수행할 수 있도록 스크립트를 이용해서 수행하시오. 
(user trace file zip 다운 받기)

trace_on.sql
trace_off.sql
trace_file.sql
- 첫 번째 줄에 / 를 \ 로 바꿔준다.
tkprof.sql
→ 4개의 파일을 trace 폴더로 옮긴다. 

- 명령 프롬포트 창에서 trace 폴더로 가서 스크립트를 실행한다.

실행순서:
@trace_on.sql

select /*+ full(emp) */  ename, sal
from  emp
where  sal = 3000;

@trace_off.sql
@trace_file.sql
@tkprof
→ D:\ORACLE2\DIAG\RDBMS\XE\XE\TRACE\xe_ora_6504.trc
→ result는 아무거나 써도 된다. (뒤에 .txt 파일 유형 이름 붙이기)

문제2.  아래의 SQL을 SQL trace 를 생성하시오 ! 레포트 이름은 report07.txt
로  하세요 !
select /*+ index(emp emp_sal) */  ename, sal
from  emp
where  sal = 3000;

답: 
@trace_on.sql

select /*+ index(emp emp_sal) */  ename, sal
from  emp
where  sal = 3000;

@trace_off.sql
@trace_file.sql
@tkprof
→ D:\ORACLE2\DIAG\RDBMS\XE\XE\TRACE\xe_ora_6504.trc
→ result07.txt