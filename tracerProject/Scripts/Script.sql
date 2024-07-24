CREATE TABLE TRACER_Test(
	TestVarchar VARCHAR2(50),
	TestNumber NUMBER,
	TestDate DATE
);

SELECT * FROM TRACER_TEST;

SELECT count(*)
FROM TASK
WHERE trunc(START_DATE) = trunc(SYSDATE);

SELECT count(*)
FROM task
WHERE START_DATE BETWEEN trunc(sysdate, 'IW')
AND trunc(sysdate, 'IW')+6;