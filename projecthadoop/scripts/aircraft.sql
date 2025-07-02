SET hive.exec.mode.local.auto=true;
USE crashes;
SELECT "Number of Crashes Per Aircraft ..";
SELECT 'AIRCRAFT', 'COUNT';
SELECT 
  aircraft_type,
  COUNT(*) AS total_crashes
FROM 
  crashestable
WHERE 
  aircraft_type IS NOT NULL AND aircraft_type != ''
GROUP BY 
  aircraft_type
ORDER BY 
  total_crashes DESC
LIMIT 10;
