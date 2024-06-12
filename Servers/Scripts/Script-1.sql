SELECT * FROM emp; -- ctrl + enter
/*
# 데이터베이스 주석문(여러줄)
* */
-- 데이터베이스 주석문(단일줄)
/*
# sql문
1. oracle sql은 oracle 데이터베이스를 위한 표준 쿼리 언어
2. 데이터를 관리하고 조작하는데 필수적인 도구로, sql(Structed Query Language)의 강력한 확장 포함
3. 주요 특징
	1) 다양한 데이터 유형 지원:
		oracle sql은 표준 숫자, 문자열 데이터 유형 외에도 날짜, 타임스탬프, xml 등 다양한 데이터 유형 지원
	2) 고급 sql 기능: 분석함수, 모델 함수, 정규표현식 등 고급 기능을 제공하여 복잡한 데이터 분석과 처리 가능
4. sql과 일반 프로그램 언어의 차이점
	1) sql
		용도: 데이터베이스에서 데이터를 추출하여 문제 해결
		입출력: 입력은 테이블, 출력은 테이블
		번역: DBMS
		문법에 따른 기본 코드: select * from book;
	2) 일반 프로그래밍 언어
		용도: 모든 프로그램적인 문제 해결
		입출력: 모든 형태의 입출력 가능
		번역: 컴파일러
		문법에 따른 기본 코드: int main() {수행하는 코드}
# sql 기능에 따른 분류
1. 데이터 정의어(DDL)
	테이블이나 관계의 구조를 생성하는 데 사용
	create, alter, drop문 등
2. 데이터 조작어(DML)
	테이블에 데이터를 검색, 삽입, 수정, 삭제하는 데 사용
	select, insert, delete, update문 등
	select문: 질의어(query)
3. 데이터 제어어(DCL)
	데이터의 사용 권한을 관리하는 데 사용
	grant, revoke문등
# 기본 질의의 구조
select ename, job, loc
from emp
where sal>=3000

1. select: 질의 결과 추출되는 속성 리스트를 열거
2. from: 질의에 어느 테이블이 사용되는지 열거
3. where: 질의의 조건을 작성
* */
SELECT ename, job, sal
FROM emp
WHERE sal>=3000;