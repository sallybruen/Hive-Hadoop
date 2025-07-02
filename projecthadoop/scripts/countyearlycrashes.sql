SET hive.exec.mode.local.auto=true;
USE crashes;
SELECT "Number of Plane Crashes Per Year ..." AS message;
SELECT 'YEAR', 'COUNT';
SELECT 
  SPLIT(crash_date, '/')[2] AS crash_year,
  COUNT(*) AS total_crashes
FROM 
  crashestable
WHERE 
  crash_date IS NOT NULL AND crash_date != ''
GROUP BY 
  SPLIT(crash_date, '/')[2]
ORDER BY 
  crash_year;
