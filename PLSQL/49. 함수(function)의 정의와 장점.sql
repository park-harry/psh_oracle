
-함수를 사용하지 않았을 때:

SELECT  ename, sal, case when sal >= 3000 then  '고소득'
when sal >= 2000 then  '중간소득'
else  '저소득'  end  "소득"
from  emp;

- 함수를 사용했을 때:
SELECT ename, sal, fun179(ename) 소득
FROM emp;