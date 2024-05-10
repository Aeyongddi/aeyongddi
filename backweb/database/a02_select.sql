SELECT * FROM emp;
SELECT empno, ename, job, SAL -- 열단위로 선택
FROM emp
WHERE sal>=2000; -- 행단위로 filtering
/*
# 데이터의 산술연산자와 문자열 연결처리
1. 컬럼의 타입이 숫자면 산술연산자(+,-,*,/) 처리
2. 컬럼의 타입이 문자열이면 ||를 통해서 연결, 문자열로 된 데이터와 || 숫자형도 연결되어 처리
3. 문자열 데이터를 표현하는 방법: '문자열데이터'로 데이터베이스는 활용 
!!주의!! "alias에 사용" : 문자열데이터로 사용하지 못함
 */
SELECT sal, sal*2 급여두배, sal+10 "급여+10"
FROM emp;
SELECT empno, DEPTNO, empno + deptno "칼럼간연산"
FROM emp;
SELECT ename, ename|| '님 입니다.', ename|| ' - ' || deptno "문자+숫자"
FROM EMP;
-- ex1) 각 사원의 이름과 급여, 급여의 3배 출력
-- ex2) 사원번호, 사원명, 사원명(사원번호)
-- ex3) 사원명, 급여, 급여의 10%, 급여+급여의 10% 합산액
SELECT ename "이름", sal "급여", sal*3 "급여 3배"
FROM emp;
SELECT empno "사원번호", ename "사원명", ename || '(' || empno || ')' AS "사원명(사원번호)"
FROM emp;
-- 사원명, 급여, 사원명{급여} 출력
SELECT ename "사원명", sal, ename || '{' || sal || '}' AS "사원명{급여}"
FROM emp;
SELECT ename "사원명", sal "급여", sal*0.1 "급여의 10%", sal+sal*0.1 "급여의 110%"
FROM emp;
