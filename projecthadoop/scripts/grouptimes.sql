SET hive.exec.mode.local.auto=true;
USE crashes;
SELECT "Most Common Times of Day for Crashes .." AS message;

WITH crash_data AS (
  SELECT 
    crash_time,
    CASE
      WHEN crash_time IS NULL OR crash_time = '' THEN NULL
      ELSE CAST(SUBSTRING(crash_time, 1, INSTR(crash_time, ':') - 1) AS INT)
    END AS crash_hour
  FROM 
    crashestable
)
SELECT 
  CASE 
    WHEN crash_hour BETWEEN 5 AND 11 THEN 'Morning (5-12)'
    WHEN crash_hour BETWEEN 12 AND 16 THEN 'Afternoon (12-17)'
    WHEN crash_hour BETWEEN 17 AND 20 THEN 'Evening (17-21)'
    WHEN crash_hour BETWEEN 21 AND 23 THEN 'Night (21-24)'
    WHEN crash_hour BETWEEN 0 AND 4 THEN 'Late Night (0-5)'
  END AS time_of_day,
  COUNT(*) AS total_crashes
FROM 
  crash_data
WHERE 
  CASE 
    WHEN crash_hour BETWEEN 5 AND 11 THEN 'Morning (5-12)'
    WHEN crash_hour BETWEEN 12 AND 16 THEN 'Afternoon (12-17)'
    WHEN crash_hour BETWEEN 17 AND 20 THEN 'Evening (17-21)'
    WHEN crash_hour BETWEEN 21 AND 23 THEN 'Night (21-24)'
    WHEN crash_hour BETWEEN 0 AND 4 THEN 'Late Night (0-5)'
  END IS NOT NULL
GROUP BY 
  CASE 
    WHEN crash_hour BETWEEN 5 AND 11 THEN 'Morning (5-12)'
    WHEN crash_hour BETWEEN 12 AND 16 THEN 'Afternoon (12-17)'
    WHEN crash_hour BETWEEN 17 AND 20 THEN 'Evening (17-21)'
    WHEN crash_hour BETWEEN 21 AND 23 THEN 'Night (21-24)'
    WHEN crash_hour BETWEEN 0 AND 4 THEN 'Late Night (0-5)'
  END
ORDER BY 
  total_crashes DESC;

