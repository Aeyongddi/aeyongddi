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

