/*
# ORACLE에서 WHERE 조건문으로 키워드 검색 처리
1. 컬럼 LIKE를 활용하여 비슷한 키워드로 검색을 할 수 있다
	ex) ename에서 S가 포함되는 경우, job 'MAN'가 포함되는 경우
2. 기본 형식
	1) WHERE 컬럼명 LIKE '%키워드%'
		해당 컬럼의 구성요소로 특정한 키워드를 포함되는 경우를 검색
		ex) 웹 시스템에서 검색할 경우 많이 사용되는 형태
		
	2) WHERE 컬럼명 LIKE '시작키워드%'
		해당 컬럼에 특정 시작키워드로 처리되는 경우
		ex) '사과%' 반드시 앞에 사과가 붙여 있고 그 외는 다른 단어가 붙어 있는 것
		
	3) WHERE 컬럼명 LIKE '%마지막키워드'
		해당 컬럼에 특정 마지막키워드로 종료되는 경우
		ex) '%세일품목' 반드시 마지막에 세일품목이라고 끝날 때 검색
		
	4) WHERE 컬럼명 LIKE '_A%'
		두번째 문자가 A로 시작하는 경우
		_: 한 칸당 해당 자리를 정확하게 지켜주는 것, 문자열이 어떤 내용인지는 문제 없음
		한자리 문자를 포함해서 두번째 문자가 'A'로 되어있고 그 외에 여러가지 문자가 있는 경우
		ex) '_A%' => 'BAKER' 'CAKE'
		
	5) WHERE 컬럼명 LIKE '__A__'
		총 글자가 5자이고, 중간 문자가 A인 경우
		ex) 위 같은 경우 앞에 두 글자를 두고 반드시 세 번째 A문자를 두고 그 뒤에 문자 수가 2글자인 경우
		'__A__' : 다섯 글자 중 중간에 A를 포함하는 경우
			LOATE ABAKE
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