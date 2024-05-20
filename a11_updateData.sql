/*

 */
SELECT * FROM emp01;
UPDATE emp01
	SET ename = '오길동'
	WHERE empno = 7369;
UPDATE emp01
	SET sal = sal +1000, -- 기존 sal에 1000더하여 줌
	DEPTNO = 50
	WHERE sal < 1000; -- 1000미만인 조건
-- ex1) job이 SALESMAN 인 데이터를 셀즈맨으로 변경

UPDATE emp01
SET job = '셀즈맨'
WHERE job = 'SALESMAN';
-- ex2) 부서번호가 20인 데이터의 급여를 현재 급여에서 10% 인상하여 처리
UPDATE emp01	
SET sal = sal + (sal*0.1)
WHERE DEPTNO = 20;
/*
# 컬럼의 크기 변경
1. 컬럼에 데이터 입력 시, 수정 시 해당 컬럼의 데이터 타입이 맞지 않거나 더 많은 데이터를 입력해야 하는 경우에
아래 형식으로 구조 변경
2. 기본 형식
	alter table 테이블명
	modify 컬럼명 변경할 유형;
*/
SELECT * FROM emp01;
INSERT INTO emp01(ENAME) values('MR.홍길동');

ALTER TABLE EMP01 
MODIFY ename varchar2(50);
-- ex) emp04 복사테이블을 만들고 사원명, 직책의 크기를 100으로 변경 / 등록, 수정

CREATE TABLE emp04
AS SELECT * FROM emp
WHERE 1=0;

ALTER TABLE EMP04 
MODIFY ename varchar2(100)
MODIFY job varchar2(100);
SELECT * FROM emp04;
INSERT INTO emp04(ename) VALUES ('이름이름');