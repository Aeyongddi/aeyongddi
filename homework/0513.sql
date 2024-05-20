-- 1. `ename` 컬럼에서 이름에 'A'가 포함되는 모든 직원의 이름을 조회하시오.
SELECT ename
FROM EMP e 
WHERE ename LIKE '%A%';
-- 2. `job` 컬럼에서 'MAN'으로 시작하는 직책을 가진 모든 직원의 이름과 직책을 조회하시오.
SELECT ename, job
FROM EMP e 
WHERE job LIKE 'MAN%';
-- 3. `deptno` 컬럼에서 '10'으로 끝나는 부서 번호를 가진 직원들의 모든 정보를 조회하시오.
SELECT *
FROM EMP e
WHERE deptno LIKE '%10';
-- 4. `ename`에서 두 번째 글자가 'L'인 모든 직원의 이름과 급여를 조회하시오.
SELECT ename, sal
FROM EMP e 
WHERE ename LIKE '_L%';
-- 5. `job`에서 글자 수가 5개이며, 중간 글자가 'A'인 직책을 가진 직원들의 이름을 조회하시오.
SELECT ename, job
FROM EMP e 
WHERE JOB LIKE '__A__';
-- 6. `emp` 테이블에서 모든 직원을 급여(sal) 기준으로 오름차순으로 정렬하여 조회하시오.
SELECT *
FROM EMP e 
ORDER BY sal;
-- 7. `emp` 테이블에서 직원들을 부서 번호(deptno)별로 내림차순, 그리고 이름(ename)별로 오름차순으로 정렬하여 조회하시오.
SELECT *
FROM EMP e 
ORDER BY  DEPTNO DESC, ename;
-- 8. `emp` 테이블에서 매니저 ID(mgr)와 급여(sal)를 기준으로 먼저 매니저 ID는 오름차순, 급여는 내림차순으로 정렬하여 조회하시오.
SELECT *
FROM EMP e 
ORDER BY mgr, sal DESC;
-- 9. `emp` 테이블에서 직원들을 입사 날짜(hiredate)의 최근 순으로 정렬하여 조회하시오.
SELECT *
FROM EMP e 
ORDER BY hiredate DESC;
-- 10. `emp` 테이블에서 직책(job)을 알파벳 순으로 정렬하고, 같은 직책 내에서는 급여(sal)를 내림차순으로 정렬하여 조회하시오.
SELECT *
FROM emp e
ORDER BY JOB, sal DESC;