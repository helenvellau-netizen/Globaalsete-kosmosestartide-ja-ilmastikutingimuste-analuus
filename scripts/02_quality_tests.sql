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
