/*
# 데이터의 삭제
1. 삭제는 행 단위로 처리하기 때문에 특정한 컬럼을 지정하진 못한다
2. 기본 형식
	delete
	from 테이블명
	where 조건문
*/
SELECT * FROM emp04;
DELETE 
FROM EMP04 
WHERE deptno = 1000;
DELETE 
FROM EMP04 
WHERE job LIKE '%MAN'
OR deptno = 20;
DELETE 
FROM emp04
WHERE ename LIKE '이름이름';


CREATE TABLE emp05
AS SELECT * FROM emp;
SELECT * FROM emp05;
DELETE 
FROM emp05
WHERE sal >= 4000 OR deptno = 10;
/*
# 테이블 이름 바꾸기
rename 기본테이블명 to 바꿀테이블명 
# 테이블 삭제하기
drop table 테이블명;
 */

RENAME emp04 TO emp10;
SELECT * FROM emp10;
SELECT * FROM emp02;
DROP TABLE emp02;
-- ex) dept02 = > dept20 변경 / dept20 테이블 삭제
RENAME dept02 TO dept20;
DROP TABLE dept20;