SET hive.exec.mode.local.auto=true;
USE crashes;
SELECT "Number of Crashes Per Category ..." AS message;
SELECT 
  crash_cause,
  COUNT(*) AS total_crashes
FROM (
  SELECT 
    CASE 
      WHEN summary IS NULL OR summary = '' OR summary = '\t' OR summary = '\n' THEN 'Unknown'
		WHEN LOWER(summary) LIKE '%shot down%' THEN 'Shot Down'
      WHEN LOWER(summary) LIKE '%fire%' OR LOWER(summary) LIKE '%spark%' OR LOWER(summary) LIKE '%flame%' OR LOWER(summary) LIKE '%explosive%' THEN 'Fire'
      WHEN LOWER(summary) LIKE '%engine%' OR LOWER(summary) LIKE '%power%' OR LOWER(summary) LIKE '%exploded%' OR LOWER(summary) LIKE '%structural failure%' THEN 'Engine Failure'
      WHEN LOWER(summary) LIKE '%weather%' OR LOWER(summary) LIKE '%wind%' OR LOWER(summary) LIKE '%blizzard%' OR LOWER(summary)  LIKE '%lightning%' OR LOWER(summary) LIKE '%storm&' OR LOWER(summary) LIKE '%rain%' OR LOWER(summary) LIKE '%fog%' OR LOWER(summary) LIKE '%visibility%' THEN 'Weather'
      WHEN LOWER(summary) LIKE '%bird%' OR LOWER(summary) LIKE '%flock%' THEN 'Bird Strike'
      WHEN LOWER(summary) LIKE '%collision%' OR LOWER(summary) LIKE '%collided%' THEN 'Mid-air Collision'
      WHEN LOWER(summary) LIKE '%takeoff%' OR LOWER(summary) LIKE '%take off%' OR LOWER(summary) LIKE '%taking off%' THEN 'Takeoff Accident'
		WHEN LOWER(summary) LIKE '%land%' THEN 'Landing Accident'
      WHEN LOWER(summary) LIKE '%fuel%' OR LOWER(summary) LIKE '%fuselage&' THEN 'Fuel Problem'
      WHEN LOWER(summary) LIKE '%mechanical%' OR LOWER(summary) LIKE '%equipment%' OR LOWER(summary) LIKE '%gear%' OR LOWER(summary) LIKE '%rudder%' OR LOWER(summary) LIKE '%control problem%' OR LOWER(summary) LIKE '%wing%' THEN 'Mechanical Failure'
      WHEN LOWER(summary) LIKE "%pilot's failure%" OR LOWER(summary) LIKE '%pilot error%' OR LOWER(summary) LIKE '%misjudged%' OR LOWER(summary) LIKE '%forgot%' OR LOWER(summary) LIKE '%mayday%' THEN "Pilot's Failure"
		WHEN LOWER(summary) LIKE '%hijack%' THEN 'Hijacking'
      ELSE 'Other'
    END AS crash_cause
  FROM crashestable
) AS categorized
GROUP BY crash_cause
ORDER BY total_crashes DESC;
