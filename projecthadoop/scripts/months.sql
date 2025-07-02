SET hive.exec.mode.local.auto=true;
USE crashes;
SELECT "Most Common Months for Crashes ..." AS message;

SELECT		SPLIT(crash_date, '/')[0] AS crash_month,
  				COUNT(*) AS total_crashes
FROM 			crashestable
WHERE 		crash_date IS NOT NULL AND crash_date != ''
GROUP BY 	SPLIT(crash_date, '/')[0]
ORDER BY 	total_crashes DESC;
