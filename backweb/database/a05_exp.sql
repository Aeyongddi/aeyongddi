SELECT *
FROM emp;
SELECT ename, sal, DEPTNO, JOB 
FROM emp 
WHERE DEPTNO = 20 AND job = 'ANALYST';
SELECT ename, job, SAL 
FROM emp 
WHERE sal BETWEEN 1000 AND 2000;
SELECT ename, deptno
FROM emp 
WHERE MGR IS NOT NULL;
SELECT ename, deptno
FROM emp 
WHERE comm IS NULL AND  job = 'CLERK';
SELECT ename, sal, deptno
FROM emp 
where deptno in(10,20,40);
SELECT ename, job, SAL 
FROM EMP 
WHERE job in('MANAGER', 'ANALYST','CLERK');
SELECT ename, sal, comm
FROM emp
WHERE sal >= 1500 AND comm IS NOT null;
SELECT ename, sal, deptno
FROM emp 
WHERE deptno != 10 AND sal <= 3000;
SELECT ename, job, deptno
FROM emp 
WHERE (job ='SALESMAN' OR job = 'CLERK')
AND (deptno !=10 AND deptno !=30);
SELECT ename, job, sal
FROM emp 
WHERE job != 'MANAGER' AND sal >= 2000;