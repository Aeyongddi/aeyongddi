SELECT * FROM ResourceManage WHERE pid = 'PID00082' AND rtype = 'BUDGET';
UPDATE ResourceManage SET used_budget = used_budget + 10000 WHERE pid = 'PID00082' AND rtype = 'BUDGET';
SELECT * FROM RESOURCEMANAGE;

SELECT * FROM ResourceManage WHERE pid = 'PID00082' AND rtype = 'BUDGET';
UPDATE ResourceManage SET used_budget = used_budget + 10000 WHERE pid = 'PID00082' AND rtype = 'BUDGET';
COMMIT;

SELECT trigger_name
FROM user_triggers
WHERE table_name = 'RESOURCEMANAGE';

SELECT object_type
FROM user_objects
WHERE object_name = 'RESOURCEMANAGE';

CREATE SEQUENCE approval_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE calendar(
"ID" NUMBER, 
	"TITLE" VARCHAR2(200), 
	"WRITER" VARCHAR2(50), 
	"START1" VARCHAR2(50), 
	"END1" VARCHAR2(50), 
	"CONTENT" VARCHAR2(1000), 
	"BACKGROUNDCOLOR" VARCHAR2(50), 
	"TEXTCOLOR" VARCHAR2(50), 
	"ALLDAY" NUMBER(1,0), 
	"URLLINK" VARCHAR2(200)
);

SELECT * FROM calendar;
DROP TABLE calendar;
