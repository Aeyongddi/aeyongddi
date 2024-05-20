-- 1. 테이블에 데이터의 입력하는 2가지 형식을 기술하세요.
-- insert, 데이터 입력 form
-- 2. 테이블에 특정 컬럼에 날짜 데이터를 입력하는 형식을 기술하세요.
-- to_date('20241111','YYYYMMDD')
-- 3. 사원번호, 사원명, 입사일, 급여 테이블(emp05)을 만들고, 전체 데이터와 일부 컬럼 데이터를 입력하세요
CREATE TABLE emp055(
	empno NUMBER,
	ename varchar2(50),
	hiredate DATE,
	sal NUMBER
	);
SELECT * FROM emp055;
INSERT INTO emp055 values(123,'하이',to_date('20240520','YYYYMMDD'),3000);
-- 4. 학생테이블(no, 이름, 국어, 영어, 수학)을 만들고, 번호와 이름만 할당, 전체컬럼을 할당하는 데이터를 입력하세요.
CREATE TABLE student(
	stuno NUMBER,
	sname varchar2(100),
	kor NUMBER,
	eng NUMBER,
	math number
);
SELECT * FROM student;
INSERT INTO student VALUES (11, '홍길동', 100, 90, 50);
-- 5. 데이터 베이스에서 commit과 rollback을 사용하는 이유와 eclipse에서 이를 위한 설정 처리 메뉴를 기술하세요.
-- DB에서 CRUD(Create, Read, Update, Delete)를 할때 안정성 확보를 위해서이다.
-- 상단 커밋/롤백 또는 query - commit; / rollback;
-- 6. 테이블 데이터의 수정 형식을 기술하고, 부서정보(dept01)를 수정하는 예제를 만드세요
-- update ~ 테이블 에서 // Set ~~로 // Where ~~에서
SELECT * FROM dept01;
UPDATE dept01
SET deptno = 80
WHERE deptno = 30;
-- 7. 학생테이블(student-번호,이름, 국어,영어,수학) 데이터를 3개입력후, 국어, 영어, 수학 평균점수가 80이상인 학생의
--         국어,영어,수학점수를 5%씩 향상하세요.
INSERT INTO student VALUES (12, '김길동', 80, 70, 95);
INSERT INTO student VALUES (13, '유길동', 30, 80, 55);
UPDATE student
SET kor = kor * 1.05, eng = eng * 1.05, math = math * 1.05
WHERE (kor+eng+math)/3 >= 80;
-- 10. 회원가입형 쇼핑몰에서 필요한 membershopping 테이블을 만들고, 이 테이블에 회원가입, 회원 검색(회원이름), 
--	로그인처리, 회원가입, 회원수정, 회원탈퇴시 사용되는 sql를 실습예제와 함께 작서앻 보세요.
CREATE TABLE membershopping(
	memName varchar2(100),
	email varchar2(200),
	memNumber NUMBER,
	grade varchar2(50)
);
-- : 회원가입 시 이름, 이메일을 입력하고 회원가입 후 회원번호와 회원등급을 생성한다.
-- 구매, 누적 금액에 따라 (조건문) 등급 변경
SELECT * FROM membershopping;
INSERT INTO membershopping VALUES ('가길동', 'gagildong@naver.com', 111, '신입');
INSERT INTO membershopping VALUES ('나길동', 'nagildong@naver.com', 222, '보통');
INSERT INTO membershopping VALUES ('다길동', 'dagildong@naver.com', 333, 'VIP');
-- 11. salgrade 테이블을 복사테이블 2개를 만들어 하나는 이름을 변경하고, 하나는 삭제하는 처리를 하세요
CREATE TABLE SALGRADE011
AS SELECT * FROM SALGRADE;
SELECT * FROM SALGRADE011;
CREATE TABLE SALGRADE022
AS SELECT * FROM SALGRADE;
SELECT * FROM SALGRADE022;
RENAME SALGRADE022 TO SALGRADE023;
SELECT * FROM SALGRADE023;
DROP TABLE SALGRADE011;