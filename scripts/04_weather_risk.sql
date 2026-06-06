CREATE SCHEMA IF NOT EXISTS mart;

DROP TABLE IF EXISTS mart.weather_risk;

CREATE TABLE mart.weather_risk AS
SELECT
    location_name,
    forecast_time,
    wind_speed_ms,
    precipitation_mm,
    visibility_m,
    CASE
        WHEN wind_speed_ms > 15 THEN 40 ELSE 0
    END
    +
    CASE
        WHEN precipitation_mm > 2 THEN 30 ELSE 0
    END
    +
    CASE
        WHEN visibility_m < 5000 THEN 30 ELSE 0
    END AS weather_risk_score,
    CASE
        WHEN (
            CASE WHEN wind_speed_ms > 15 THEN 40 ELSE 0 END
            + CASE WHEN precipitation_mm > 2 THEN 30 ELSE 0 END
            + CASE WHEN visibility_m < 5000 THEN 30 ELSE 0 END
        ) >= 61 THEN 'Kõrge'
        WHEN (
            CASE WHEN wind_speed_ms > 15 THEN 40 ELSE 0 END
            + CASE WHEN precipitation_mm > 2 THEN 30 ELSE 0 END
            + CASE WHEN visibility_m < 5000 THEN 30 ELSE 0 END
        ) >= 31 THEN 'Keskmine'
        ELSE 'Madal'
    END AS weather_risk_level
FROM staging.weather_raw;