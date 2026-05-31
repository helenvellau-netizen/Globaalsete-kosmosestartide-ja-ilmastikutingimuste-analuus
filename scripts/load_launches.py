import requests
import json
import os

url = "https://lldev.thespacedevs.com/2.2.0/launch/upcoming/"

response = requests.get(url)

data = response.json()

os.makedirs("data/raw", exist_ok=True)

with open("data/raw/upcoming_launches.json", "w") as f:
    json.dump(data, f, indent=2)

print("Raw andmed salvestatud.")
