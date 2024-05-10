SELECT * FROM emp;
/* 
# where 조건문 처리
1. 행단위 데이터로 필터링하여 검색할 때 주로 사용
2. where 조건절에서는 컬럼명을 기준으로 여러가지 비교연산식과 논리연산식 처리
3. 기본 형식
	select 칼럼, ..
	from 테이블
	where 비교연산식 또는 논리연산식
4. 사용되는 비교연산식 종류
	1) 컬럼명 = 데이터 (동등비교) !!주의!! 프로그램의 == 가 아님
	2) 컬럼명 >, <, >=, <=, !=, <> 등을 활용(이 부분은 프로그램과 동일)
	3) 컬럼명 is null, 컬럼명 is not null: 값이 없을 때 처리 !!주의!! 컬럼 = null(항상 false) 로 원하는 결과를 얻지 못함
5. 사용되는 논리연산식 종류
	1) 위 비교연산식에서 and, or, not 등을 활용
		컬럼명1 = 데이터1 and 컬럼명2 = 데이터2
		컬럼명1 = 데이터1 or 컬럼명1 = 데이터1
		not (컬럼명1 = 데이터1)
		not (컬럼명1 >= 데이터1 and 컬럼명2 = 데이터2)
6. 이 외에도 여러가지 연산 키워드를 통한 비교/논리연산 처리
	1) 컬럼명 in (데이터1, 데이터2, 데이터3)
		컬럼에 데이터1 또는 데이터2 또는 데이터3이 있는 경우
	2) 컬럼명 between 시작데이터 and 마지막데이터
		컬럼에 범위를 지정하여 검색해준다
	3) exists, not exist 존재하는 경우, 그렇지 않는 경우 등
 */ 
-- 숫자데이터 비교
-- 연봉 2000이상인 사원정보
SELECT *
FROM EMP
WHERE sal>=2000;
-- 문자열 데이터 비교
SELECT *
FROM EMP
WHERE job = 'MANAGER'; -- 직책이 관리자인 경우
-- ex) 관리자번호(mgr)이 7839인 데이터의 사원명, 사원번호, 관리자번호를 출력
SELECT ename 사원명, empno 사원번호, mgr 관리자번호
FROM EMP
WHERE mgr = 7839;
-- ex) 직책이 clerk인 사원명, 직책명, 급여, 부서번호 출력
SELECT ename 사원명, job 직책명, sal 급여, deptno 부서번호
FROM emp
WHERE job ='CLERK';
-- ex) 'ward'의 사원번호, 사원명, 직책명, 입사일
SELECT empno 사원번호, ename 사원명, job 직책명, HIREDATE 입사일
FROM EMP
WHERE ename = 'WARD';
-- ex) 부서번호가 10인 사원전체 정보
SELECT *
FROM EMP
WHERE DEPTNO = 10;
-- 사직연산자와 비교연산자를 혼합한 문제
-- 급여(sal)를 2로 나눈 값이 1500보다 큰 직원 찾기
 SELECT *
 FROM EMP
 WHERE sal/2 >= 1500;
SELECT sal, comm,empno, empno*10,sal+comm "합"
FROM emp;
WHERE sal+comm < empno*10;
SELECT *
FROM EMP 
WHERE sal+comm < empno *10;
-- ex1) 급여(sal)에 500에 더했을때 부서번호 (deptno)의 50배보다 큰 직원
SELECT *
FROM emp
WHERE sal+500 > deptno*50;
-- ex2) 부서번호가 급여를 40으로 나눈 결과보다 작거나 같은 직원
SELECT *
FROM emp
WHERE DEPTNO <= sal/40;
-- ex3) 커미션이 급여의 15%이하인 직원 중 급여가 2500이상인 직원
SELECT *
FROM EMP
WHERE comm <= sal*0.15 
AND sal >= 2500;