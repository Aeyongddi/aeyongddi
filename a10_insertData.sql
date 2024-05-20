/*
# 데이터 입력
1. 기본형식   
   insert into 테이블명 values(데이터1, 데이터2, 데이터3);
   INSERT INTO 테이블명(컬럼1, 컬럼2) values(컬럼1의 입력데이터, 컬럼2의 입력데이터)
*/
SELECT * FROM emp01;
-- 모든컬럼의 순서에 맞게 데이터를 입력하여야 한다
-- 1) 숫자형은 숫자 그대로
-- 2) 문자열형은 '데이터'로
-- 3) 날짜형은 오늘지금시간 : sysdate, 특정날짜 to_date('yyyymmdd','20240106)
INSERT INTO emp01 values(1000,'홍길동','사원',7839,sysdate,4000,1000,10);
INSERT INTO emp01(empno, ename, hiredate)
   values(1000,'홍길동',to_date('20240101','YYYYMMDD'));
SELECT * FROM emp01;
-- ex) emp03 으로 복사테이블 만들고 전체 데이터 입력, 사원번호, 이름, 2024/06/01, 부서번호를 입력
CREATE TABLE emp03
AS SELECT * FROM emp
WHERE 1=0;
SELECT * FROM emp03;
INSERT INTO emp03 values(2000, '길길동', 'CLER', 7902, sysdate, 3000,100,10);
INSERT INTO emp03(EMPNO, ENAME, HIREDATE, DEPTNO)
			values(1002, '오길동', to_date('2024/06/01','YYYY/MM/DD'),20);
SELECT * FROM DEPT01;
-- ex1) 부서번호와 부서명
-- ex2) 부서번호와 부서명, 부서위치
INSERT INTO dept01 values(30, 'GOODS','seoul');
INSERT INTO dept01 (DEPTNO,DNAME,LOC)
	values(30,'DEGREE','SEOUL');
/*
# 데이터베이스에서 transaction 처리
1. 데이터베이스에서 crud시 안정성 확보를 위하여
2. commit, rollback 개념 사용
3. commit(확정)전에는 rollback 가능
4. commit 전에는 현재 session(클라이언트/서버) 연결에서만 등록/수정/삭제 된 걸로 보인다.
5. commit 전에는 rollback을 하면 이전 상태로 다시 돌아감
6. commit 후에는 rollback을 하더라도 복구 되지 않음
7. commit 전에는 session을 닫으면 다시 이전 변경 전 상태로 다시 돌아간다
8. commit을 하면 다른 client도 동일한 데이터를 확인할 수 있다
 */
SELECT * FROM DEPT01;
INSERT INTO dept01 values(60,'기획','분당');
SELECT * FROM dept01;
ROLLBACK;
INSERT INTO dept01 values(70,'총무','인천');
COMMIT; -- 확정
ROLLBACK; -- 하더라도 입력된 내용 확인 가능