SET hive.exec.mode.local.auto=true;
USE crashes;
SELECT "Number of Passengers, Fatalities and Survivors Per Year ..." AS message;
SELECT 'YEAR', 'CRASHES', 'ABOARD', 'FATALITIES', 'SURVIVORS';
SELECT 
  SPLIT(crash_date, '/')[2] AS crash_year,
  COUNT(*) AS total_crashes,
  SUM(aboard) AS total_passengers,
  SUM(fatalities) as total_fatalities,
  (SUM(aboard) - SUM(fatalities)) AS total_survivors
FROM 
  crashestable
WHERE 
  crash_date IS NOT NULL AND crash_date != ''
GROUP BY 
  SPLIT(crash_date, '/')[2]
ORDER BY 
  crash_year;
