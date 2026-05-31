CREATE SCHEMA IF NOT EXISTS mart;

DROP TABLE IF EXISTS mart.company_launches;

CREATE TABLE mart.company_launches AS
SELECT
    provider_name,
    COUNT(*) AS launch_count
FROM staging.launches_raw
WHERE provider_name IS NOT NULL
GROUP BY provider_name
ORDER BY launch_count DESC;
