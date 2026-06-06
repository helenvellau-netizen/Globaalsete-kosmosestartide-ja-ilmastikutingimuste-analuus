import requests
import pandas as pd
from sqlalchemy import create_engine, text
from dotenv import load_dotenv
import os

load_dotenv(".env")

engine = create_engine(
    f"postgresql://{os.getenv('POSTGRES_USER')}:{os.getenv('POSTGRES_PASSWORD')}@localhost:{os.getenv('DB_PORT_HOST')}/{os.getenv('POSTGRES_DB')}"
)

# MVP: kasutame kahte aktiivset stardiplatvormi
locations = [
    {
        "location_name": "Cape Canaveral SFS, FL, USA",
        "latitude": 28.5618571,
        "longitude": -80.577366,
    },
    {
        "location_name": "Vandenberg SFB, CA, USA",
        "latitude": 34.742,
        "longitude": -120.5724,
    },
]

rows = []

for loc in locations:
    url = "https://api.open-meteo.com/v1/forecast"
    params = {
        "latitude": loc["latitude"],
        "longitude": loc["longitude"],
        "hourly": "wind_speed_10m,precipitation,visibility",
        "wind_speed_unit": "ms",
        "forecast_days": 1,
    }

    response = requests.get(url, params=params, timeout=30)
    response.raise_for_status()
    data = response.json()

    hourly = data["hourly"]

    for i, forecast_time in enumerate(hourly["time"]):
        rows.append({
            "location_name": loc["location_name"],
            "forecast_time": forecast_time,
            "wind_speed_ms": hourly["wind_speed_10m"][i],
            "precipitation_mm": hourly["precipitation"][i],
            "visibility_m": hourly["visibility"][i],
        })

df = pd.DataFrame(rows)

with engine.begin() as conn:
    conn.execute(text("CREATE SCHEMA IF NOT EXISTS staging"))

df.to_sql(
    "weather_raw",
    engine,
    schema="staging",
    if_exists="replace",
    index=False,
)

print(f"Laetud PostgreSQL-i {len(df)} ilmaandmete rida tabelisse staging.weather_raw")
