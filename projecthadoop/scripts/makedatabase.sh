./runsql.sh droptable.sql
rm -r metastore_db
rm derby.log
schematool -initSchema -dbType derby
hdfs dfs -rm -r /user/hive/warehouse/crashes.db
hdfs dfs -put filteredcrashes.csv /crashes/
hive -S -f makecrashes.sql
