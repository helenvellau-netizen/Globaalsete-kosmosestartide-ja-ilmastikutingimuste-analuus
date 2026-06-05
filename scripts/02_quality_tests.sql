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

-- Test 4: launch_count peab olema positiivne
SELECT *
FROM mart.company_launches
WHERE launch_count <= 0;

-- Test 5: location launch_count peab olema positiivne
SELECT *
FROM mart.launches_by_location
WHERE launch_count <= 0;