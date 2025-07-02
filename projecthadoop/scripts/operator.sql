SET hive.exec.mode.local.auto=true;
USE crashes;
SELECT "Number of Crashes Per Operator ...";
SELECT 'OPERATOR', 'COUNT';
SELECT 
  operator,
  COUNT(*) AS total_crashes
FROM 
  crashestable
WHERE 
  operator IS NOT NULL AND operator != ''
GROUP BY 
  operator
ORDER BY 
  total_crashes DESC
LIMIT 10;
