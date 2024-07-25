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
DROP TABLE asset;
CREATE TABLE ResourceManage(
	rid varchar2(8) PRIMARY KEY,
	rtype varchar2(8) NOT NULL,
	assigned_budget number(15,2),	
	used_budget NUMBER(15,2),
	software_name varchar2(255),
	license_purchase_date DATE,
	license_expiry_date DATE,
	software_price number(15,2),
	pid varchar2(8),
	CONSTRAINT fk_project FOREIGN KEY (pid) REFERENCES project(pid),
	CONSTRAINT chk_rtype CHECK (rtype IN ('BUDGET','SOFTWARE'))
);
CREATE SEQUENCE resource_seq
START WITH 1
INCREMENT BY 1
nocache;

SELECT * FROM ResourceManage;
SELECT * FROM board;
SELECT * FROM project;
ALTER TABLE board add(
	IS_END char(1)
);
COMMIT;

-- 테스트 데이터 삽입
INSERT INTO ResourceManagement (rid, rtype, assigned_budget, used_budget, software_name, license_purchase_date, license_expiry_date, software_price, pid)
VALUES (resource_seq.nextval, 'BUDGET', 1000000, 250000, NULL, NULL, NULL, NULL, 'P001');
INSERT INTO ResourceManage (rid, rtype, assigned_budget, used_budget, software_name, license_purchase_date, license_expiry_date, software_price, pid)
VALUES (resource_seq.nextval, 'BUDGET', 3000000, 300000, NULL, NULL, NULL, NULL, 'P002');
INSERT INTO ResourceManage (rid, rtype, assigned_budget, used_budget, software_name, license_purchase_date, license_expiry_date, software_price, pid)
VALUES (resource_seq.nextval, 'BUDGET', 500000, 100000, NULL, NULL, NULL, NULL, 'P003');
INSERT INTO ResourceManagement (rid, rtype, assigned_budget, used_budget, software_name, license_purchase_date, license_expiry_date, software_price, pid)
VALUES (resource_seq.nextval, 'SOFTWARE', NULL, NULL, 'Software A', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), 15000, 'P002');
INSERT INTO ResourceManagement (rid, rtype, assigned_budget, used_budget, software_name, license_purchase_date, license_expiry_date, software_price, pid)
VALUES (resource_seq.nextval, 'SOFTWARE', NULL, NULL, 'Software B', TO_DATE('2022-05-15', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'), 30000, 'P003');

/*SELECT assigned_budget, used_budget
FROM ResourceManagement
WHERE rtype = 'BUDGET' AND pid = #{pid}*/

SELECT * FROM project;

SELECT assigned_budget, used_budget
				FROM ResourceManage
				WHERE rtype = 'BUDGET' AND pid = 'P001';
			
SELECT pid, title FROM PROJECT;

SELECT * FROM task;

ALTER TABLE board
MODIFY is_end number(1);
COMMIT;

GRANT ALTER ON board TO GE;
