./runsql.sh droptable.sql
rm -r metastore_db
rm derby.log
schematool -initSchema -dbType derby
hdfs dfs -put diamonds.csv /diamonds/
hive -S -f makediamonds.sql
