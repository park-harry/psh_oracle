PL/SQL 코드를 암호화 하면 좋은 점
=> 내가 만든 코드를 상용화 할 수 있다.

1. 아래의 패키지를 생성하고 잘 작동되는지 확인하시오. 
- 명세부 작성 
CREATE OR REPLACE PACKAGE pcg_rank
AS FUNCTION fun179(p_ename emp.ename%TYPE) RETURN VARCHAR2;
END pcg_rank;
/

- 바디부 작성 
CREATE OR REPLACE PACKAGE BODY pcg_rank
AS FUNCTION fun179 (p_ename emp.ename%TYPE)
RETURN VARCHAR2
IS
    v_rank  NUMBER(5);
    v_msg   VARCHAR2(20);
BEGIN
    SELECT 순위 INTO v_rank
    FROM ( SELECT ename, DENSE_RANK() OVER ( ORDER BY sal DESC ) 순위
            FROM emp )
    WHERE ename = UPPER(p_ename);
    IF v_rank < 4 THEN
        v_msg := '고소득';
    ELSE
        v_msg := '저소득';
    END IF;
    RETURN v_msg;
END fun179;
END pcg_rank;
/

- 패키지 동작 확인
SELECT ename, sal, pcg_rank.fun179(ename) 소득
FROM emp;

2. 메모장을 열어서 패키지 명세 부분을 작성한 후 pack01.sql 이란 이름으로 저장한다.
ed pack01.sql 

3. 메모장을 열어서 패키지 본문을 작성하고 pack01_body.sql이란 이름으로 저장한다. (sqpplus)
ed pack01_body.sql

4. 지금 접속한 sqlplus 프롬프트 창에서 exit 명령어를 수행하고 빠져 나와서 지금 작성한 2개의 
sql 파일이 잘 있는지 확인한다. 
exit; 
dir 

5. 명령 프롬프트 창에서 아래의 명령어를 수행한다. (파일 내에 한글이 없어야 한다.) 
wrap iname=pack01_body.sql oname=pack01.plb

=> iname -> input name, oname -> output name  
=> 실행 후, pack01.plb 파일을 열어서 파일이 암호화 되있으면 성공! 

※ 앞으로 위의 코드를 배포 할 때는 다음과 같이 2가지로 배포하면 된다. 
1. 명세코드와 암호화된 body 코드 
2. 패키지 명세 코드 
CREATE OR REPLACE PACKAGE pcg_rank
AS FUNCTION fun179(p_ename emp.ename%TYPE) RETURN VARCHAR2;
END pcg_rank;
/

- 패키지 암호화된 바디 코드 
CREATE OR REPLACE PACKAGE BODY pcg_rank wrapped 
a000000
34e
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
1bc 189
fqSwszdYDr+Xy8ce6oQVp9GnLl4wg3nM2dxqfC9dbmS0mSdmqDaU5zV9r1LfKA2TuvZJFrDn
XE07qW9S7v5Sihpb24efDYIccrSjhQ0W82WN/qUNVbKaZMb+WgQWo/FhKyHLxCjQLx77oSHn
tH32JEyDhwvTf4OnvXuvwtM0Xye2NwpIcDX2picTdK28riXeVXXAirYAhxlXFGrCG9D9aA6g
3bkRLisuZRzFVCovcnQg7p7AFNZBtkkOe5HGaW6YQYFw29TzX0aRjtJmx0J/H0TTnT8myH8R
FZ6jO5BDPqWRNNGLWnK4W2Hmex4CWa7VVIoomAB2SgXrwQVmdmrwr6rjLLBPJHqXVZQ4QQ/1
kbCz40Yk5wOnY/73h+ThWmonEA==
/

- 패키지 동작 확인
SELECT ename, sal, pcg_rank.fun179(ename) 소득
FROM emp;