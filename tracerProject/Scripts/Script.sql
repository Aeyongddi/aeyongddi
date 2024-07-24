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

SELECT trunc(end_date) AS end_date
from(SELECT * FROM task ORDER BY abs(trunc(start_date) - trunc(sysdate)))
WHERE rownum = 1;

SELECT 'D - '|| TO_CHAR(TRUNC(end_date) - TRUNC(SYSDATE)) AS d_day
FROM (
    SELECT *
    FROM task
    ORDER BY ABS(TRUNC(start_date) - TRUNC(SYSDATE))
)
WHERE ROWNUM = 1;

SELECT count(*)
FROM PROJECT;

SELECT * FROM task;

SELECT (completed.count_y * 100 / total.count_all) AS progress
FROM
  (SELECT COUNT(*) AS count_y FROM task WHERE isend = 'Y') completed,
  (SELECT COUNT(*) AS count_all FROM task) total;

