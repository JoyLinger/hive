set hive.mapred.mode=nonstrict;
SET hive.vectorized.execution.enabled=true;
set hive.fetch.task.conversion=none;

DROP TABLE IF EXISTS DECIMAL_3_txt;
DROP TABLE IF EXISTS DECIMAL_3;

CREATE TABLE DECIMAL_3_txt(key decimal(38,18), value int)
ROW FORMAT DELIMITED
   FIELDS TERMINATED BY ' '
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '../../data/files/kv7.txt' INTO TABLE DECIMAL_3_txt;

CREATE TABLE DECIMAL_3 STORED AS ORC AS SELECT * FROM DECIMAL_3_txt;

SELECT * FROM DECIMAL_3 ORDER BY key, value;

SELECT * FROM DECIMAL_3 ORDER BY key DESC, value DESC;

SELECT * FROM DECIMAL_3 ORDER BY key, value;

SELECT DISTINCT key FROM DECIMAL_3 ORDER BY key;

SELECT key, sum(value) FROM DECIMAL_3 GROUP BY key ORDER BY key;

SELECT value, sum(key) FROM DECIMAL_3 GROUP BY value ORDER BY value;

SELECT * FROM DECIMAL_3 a JOIN DECIMAL_3 b ON (a.key = b.key) ORDER BY a.key, a.value, b.value;

SELECT * FROM DECIMAL_3 WHERE key=3.14 ORDER BY key, value;

SELECT * FROM DECIMAL_3 WHERE key=3.140 ORDER BY key, value;

DROP TABLE DECIMAL_3_txt;
DROP TABLE DECIMAL_3;
