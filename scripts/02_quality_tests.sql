-- Test 1
SELECT COUNT(*) AS missing_launch_id
FROM staging.launches_raw
WHERE launch_id IS NULL;

-- Test 2
SELECT launch_id, COUNT(*)
FROM staging.launches_raw
GROUP BY launch_id
HAVING COUNT(*) > 1;

-- Test 3
SELECT COUNT(*) AS missing_provider
FROM staging.launches_raw
WHERE provider_name IS NULL;

-- Test 4
SELECT *
FROM mart.company_launches
WHERE launch_count <= 0;

-- Test 5
SELECT *
FROM mart.launches_by_location
WHERE launch_count <= 0;

-- Test 6
SELECT COUNT(*) AS missing_wind_speed
FROM staging.weather_raw
WHERE wind_speed_ms IS NULL;

-- Test 7
SELECT *
FROM mart.weather_risk
WHERE weather_risk_score < 0
   OR weather_risk_score > 100;