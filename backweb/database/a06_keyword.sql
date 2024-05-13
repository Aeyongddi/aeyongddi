/*
# ORACLE에서 WHERE 조건문으로 키워드 검색 처리
1. 컬럼 LIKE를 활용하여 비슷한 키워드로 검색을 할 수 있다
	ex) ename에서 S가 포함되는 경우, job 'MAN'가 포함되는 경우
2. 기본 형식
	1) WHERE 컬럼명 LIKE '%키워드%'
		해당 컬럼의 구성요소로 특정한 키워드를 포함되는 경우를 검색
	2) WHERE 컬럼명 LIKE '시작키워드%'
		해당 컬럼에 특정 시작키워드로 처리되는 경우
	3) WHERE 컬럼명 LIKE '%마지막키워드'
		해당 컬럼에 특정 마지막키워드로 종료되는 경우
	4) WHERE 컬럼명 LIKE '_A%'
		두번째 문자가 A로 시작하는 경우
	5) WHERE 컬럼명 LIKE '__A__'
		총 글자가 5자이고, 중간 문자가 A인 경우
*/
SELECT *
FROM emp;
SELECT *
FROM emp
WHERE ename LIKE '%A%';
-- ex) job에서 ES가 포함된 사원 정보 출력
SELECT *
FROM EMP e 
WHERE job LIKE '%ES%';
SELECT *
FROM EMP e 
WHERE ename LIKE 'A%';
SELECT *
FROM EMP e 
WHERE job LIKE '%MAN';
SELECT *
FROM EMP e 
WHERE ename LIKE 'JO%';
SELECT *
FROM EMP e 
WHERE job LIKE '%ER';

SELECT hiredate, to_char(hiredate) -- to_char() 문자열 형식으로 바꾸는 처리
FROM EMP e 
WHERE HIREDATE LIKE '81%'; -- 키워드 검색 시 화면에 보이는 것과 달리 to_char()에 의해 검색

SELECT *
FROM EMP e 
WHERE job LIKE '__E__'; -- 총글자가 5자이고, 3번째 E가 포함된 사원 정보
-- ex) 앞에서 4,5번째 ES를 포함한 직책(job)이 있는 사원정보
SELECT *
FROM EMP e 
WHERE job LIKE '___ES%';
-- ex) 뒤에서 세번째 자리에 M이 포함된 직책(job) 검색
SELECT *
FROM EMP e 
WHERE job LIKE '%M__';
-- ex) 자리수가 5자리이고, 중간에 I자 포함된 사원명
SELECT *
FROM EMP e 
WHERE ename LIKE '__I__';