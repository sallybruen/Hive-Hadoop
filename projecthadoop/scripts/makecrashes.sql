set hive.exec.mode.local.auto=true;
CREATE DATABASE IF NOT EXISTS crashes;
USE crashes;
CREATE TABLE crashestable (crash_date STRING, crash_time STRING, location STRING, operator STRING, route STRING, aircraft_type STRING, aboard INT, fatalities INT, summary STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' TBLPROPERTIES ("skip.header.line.count"="1");
load data inpath '/crashes/filteredcrashes.csv' INTO TABLE crashestable;
SELECT * FROM crashestable LIMIT 4;
