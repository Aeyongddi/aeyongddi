/*
3) 컬럼명 is null, 컬럼명 is not null: 값이 없을 때 처리 
!!주의!! 컬럼 = null(항상 false) 로 원하는 결과를 얻지 못함
*/
SELECT COMM 
FROM emp;
SELECT *
FROM emp
WHERE comm = NULL ; -- NULL 검색 안해줌. 항상 false(사용불가)
SELECT *
FROM emp
WHERE comm iS NULL ; -- NULL 값인 경우 검색
SELECT *
FROM emp
WHERE comm IS NOT NULL;	-- NULL 값이 아닌 경우 탐색
-- ex)사원번호, 사원명, 급여+보너스를 출력하되 보너스가 있는 경우만 출력
SELECT EMPNO 사원번호, ENAME 사원명, sal 급여, comm 보너스, sal + comm "급여 + 보너스"
FROM EMP
-- comm이 null인 경우 연산 결과값 확인 불가
WHERE comm IS NOT NULL
AND comm != 0;
-- nvl(컬럼명, 0): 해당 컬럼이 null 이면 0, 그 외에는 해당 컬럼값 처리
SELECT ENAME 사원명, sal 급여, comm 보너스1, 
nvl(comm,0) 보너스2, 
sal + comm "급여 + 보너스1", 
sal+nvl(COMM,0) "급여+보너스2"
FROM EMP;
-- ex1) nvl을 활용하여 급여+보너스 합산 2500 이상인 사원의 사원명, 급여, 보너스, 합산 출력
SELECT ename 사원명, sal 급여, nvl(comm,0) 보너스 , sal + nvl(comm,0) 합산
FROM emp
WHERE sal + nvl(comm,0) >= 2500;

-- 급여에 300을 더한 값이 1000보다 크고, 커미션이 0보다 큰 직원
SELECT sal+300, 1000, comm, 0
FROM emp;
SELECT *
FROM EMP
WHERE sal + 300 > 1000 AND comm>0;
-- 매니저 번호를 2로 나눈 결과가 750보다 작거나 커미션이 null인 직원
SELECT *
FROM emp 
WHERE MGR / 2 < 750
OR comm IS NULL;
-- ex1) 커미션이 급여의 10%보다 크지 않고, 직급이 clerk가 아닌 직원
SELECT *
FROM emp 
WHERE comm < sal*0.1 AND job != 'CLERK'; -- = <> 'CLERK'
-- ex2) 급여를 4로 나눈 결과가 1000보다 작지 않거나, 부서번호가 30인 직원
SELECT *
FROM emp 
WHERE sal / 4 > 1000 or DEPTNO = 30;
-- ex3) 급여가 2000 이상이며, 부서번호가 10이거나 20이 아닌 직원
SELECT *
FROM emp 
WHERE sal >= 2000 AND not(deptno = 10 OR DEPTNO = 20);

SELECT *
FROM EMP
WHERE sal >= 2000 AND DEPTNO NOT IN (10,20); -- in(데이터1, 데이터2) 둘다 해당하는 경우 or로 연결
-- 컬럼명 between 시작 and 마지막
SELECT *
FROM emp 
WHERE sal BETWEEN 1000 AND 3000;
SELECT *
FROM emp 
WHERE sal >= 1000 AND sal <= 3000;
-- ex) 부서번호가 10이고 급여가 3000~5000 사이인 사원정보 출력
SELECT *
FROM emp 
WHERE DEPTNO = 10 AND sal BETWEEN 3000 AND 5000;