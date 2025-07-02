SET hive.exec.mode.local.auto=true;
USE crashes;

SELECT 'Number of Crashes Per Location';

SELECT 	location_last_part,
  			COUNT(*) AS total_crashes
FROM 	(SELECT 
    		CASE
      		WHEN TRIM(SPLIT(location, ' ')[SIZE(SPLIT(location, ' ')) - 1]) IN ('Sea', 'Jersey', 'Channel', 'Island') THEN
        		CONCAT(
          		TRIM(SPLIT(location, ' ')[SIZE(SPLIT(location, ' ')) - 2]), 
          ' ', 
          		TRIM(SPLIT(location, ' ')[SIZE(SPLIT(location, ' ')) - 1])
        )
      		ELSE
        -- Otherwise, just take the last word
        			TRIM(SPLIT(location, ' ')[SIZE(SPLIT(location, ' ')) - 1])
    		END AS location_last_part
  FROM 	crashestable
  WHERE 	location IS NOT NULL AND location != ''
) AS subquery
GROUP BY 	location_last_part
ORDER BY 	total_crashes DESC
LIMIT 10;
