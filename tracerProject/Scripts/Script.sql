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
SELECT * FROM PROJECT;
SELECT * FROM SCHEDULE;

ALTER TABLE board
MODIFY is_end number(1);
COMMIT;

SELECT * FROM board;
ALTER TABLE board
RENAME COLUMN IS_end TO endYN;

SELECT p.pid, p.title, 
       (SUM(CASE WHEN t.isend = 'Y' THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS progress
FROM project p
JOIN schedule s ON p.pid = s.pid
JOIN task t ON s.sid = t.sid
WHERE p.end_date >= TRUNC(SYSDATE)
GROUP BY p.pid, p.title;

UPDATE USER_INFO SET nickname='갓갓김' WHERE email='kge0817@naver.com';
SELECT * FROM USER_INFO;

SELECT 
	u.name AS 이름,
	u.nickname AS 닉네임,
	u.email AS 이메일,
	u.birth AS 생일,
	u.phone AS 전화번호,
	t.tid AS 팀_ID,
	p.pid AS 프로젝트_ID,
	p.title AS 프로젝트_제목
FROM 
	USER_INFO u
LEFT JOIN 
	TEAM t ON u.EMAIL = t.EMAIL 
LEFT JOIN 
	PROJECT p ON t.pid = p.PID 
WHERE 
	u.email = 'zsn1527@gmail.com';
	SELECT * FROM team;
	SELECT * FROM project;
	SELECT * FROM USER_INFO;
SELECT * FROM RESOURCEMANAGE;
	COMMIT;
	
CREATE TABLE BOARD2 (
   BID VARCHAR2(8),
   TITLE VARCHAR2(50),
   CONTENT CLOB,
   UPT_DATE DATE,
   VIEWS NUMBER,
   BTYPE VARCHAR2(10),
   CID VARCHAR2(8),
   EMAIL VARCHAR2(255),
   SID VARCHAR2(8),
   ENDYN NUMBER(1,0)
);

ALTER TABLE task MODIFY (sid null);
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'TASK' AND constraint_type = 'C';
ALTER TABLE task DROP CONSTRAINT SYS_C007487;
-- 임시 테이블 생성
CREATE TABLE task_temp AS SELECT * FROM task;

-- 기존 테이블의 데이터 백업
INSERT INTO task_temp SELECT * FROM task;
-- 기존 테이블 삭제
DROP TABLE task;
SELECT * FROM task_temp;


CREATE TABLE task (
    tkid varchar2(8),
    startdate DATE,
    enddate DATE,
    isend number(1,0),
    name varchar2(255),
    description clob,
 	sid varchar2(8)
);

-- 데이터 복사
INSERT INTO task SELECT * FROM task_temp;

-- 임시 테이블 삭제
DROP TABLE task_temp;

SELECT * FROM v$version;

SELECT p.pid, p.title,
                   (SUM(CASE WHEN t.endYN = 1 THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS progress, 
                  SUM(CASE WHEN t.endYN = 1 THEN 1 ELSE 0 END) AS completedTasks, 
                  COUNT(*) AS totalTasks 
            FROM project p 
            JOIN schedule s ON p.pid = s.pid
            JOIN task t ON s.sid = t.sid
            WHERE p.end_date >= TRUNC(SYSDATE)
            GROUP BY p.pid, p.title;

CREATE SEQUENCE ResourceManageSeq START WITH 1 INCREMENT BY 1 NOCACHE;
        SELECT ResourceManageSeq.NEXTVAL FROM DUAL;
DROP SEQUENCE ResourceManageSeq;
           
SELECT * FROM board;

SELECT 'B'||LPAD(BID_SEQ.NEXTVAL, 3, '0')FROM dual;
SELECT * FROM JH.BOARD;

SELECT * FROM COMMENTS;

SELECT * FROM SCHEDULE;

SELECT * FROM COMMENTS;

INSERT INTO BOARD (bid, title, content, upt_date, views, btype, cid, email, sid, endYN) 
VALUES
('B'||LPAD(BID_SEQ.NEXTVAL, 5, '0'), '남원이', '재현이 아파', SYSDATE, 1, '하하', 'C004', 'alice@example.com', 'SID00143', 0);

INSERT INTO BOARD (bid, title, content, upt_date, views, btype, cid, email, sid, endYN, uf) 
VALUES
('B'||LPAD(BID_SEQ.NEXTVAL, 5, '0'), '남원이', '재현이 아파', SYSDATE, 1, '하하', 'C005', 'email', 'SID00143', 0,'http://www.naver.com');

DELETE FROM board WHERE bid = 'B00026';

