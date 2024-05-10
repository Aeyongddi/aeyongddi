SELECT *
FROM emp;
-- 1. **직원 조회**: 'CLERK' 직책을 가진 직원들의 이름과 급여를 조회하시오.
SELECT ename 이름, sal 급여, job 직책
FROM EMP
WHERE job = 'CLERK';
-- 2. **연봉 비교**: 급여가 2000 이상인 직원들의 이름과 직책을 조회하시오.
SELECT ename 이름, job 직책, sal 급여
FROM EMP
WHERE sal >= 2000;
-- 3. **복수 조건 검색**: 직책이 'MANAGER' 이며, 부서 번호가 10인 직원들의 모든 정보를 조회하시오.
SELECT *
FROM emp 
WHERE job = 'MANAGER' AND deptno = 10;
-- 4. **범위 지정 검색**: 급여가 1500에서 3000 사이인 직원들의 이름과 급여를 조회하시오.
SELECT ename 이름, sal 급여
FROM emp 
WHERE sal BETWEEN 1500 AND 3000;
-- 5. **Null 값 검색**: 커미션을 받지 않는 직원들의 이름과 직책을 조회하시오.
SELECT ename 이름, job 직책, comm 보너스
FROM emp 
WHERE comm IS NULL ;
-- 6. **복수 선택 검색**: 부서 번호가 10, 20, 30인 직원들의 이름과 부서 번호를 조회하시오.
SELECT ename 이름, deptno 부서번호
FROM emp 
WHERE deptno = 10 or deptno = 20 or DEPTNO = 30;
-- 7. **논리 연산 활용**: 급여가 1000 이상이며, 커미션을 받지 않는 직원들의 이름과 급여를 조회하시오.
SELECT ename 이름, sal 급여, comm 보너스
FROM emp 
WHERE sal >= 1000 AND comm IS NULL;
-- 8. **복잡한 논리 연산**: 직책이 'SALESMAN'이 아니면서, 부서 번호가 30이 아닌 직원들의 이름과 직책을 조회하시오.
SELECT ename 이름, job 직책, deptno "부서 번호"
FROM emp 
WHERE job != 'SALESMAN' AND DEPTNO != 30;
