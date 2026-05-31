# Edenemisraport

## Mis on valmis

* [ ] Docker Compose käivitab kõik teenused
* [x] Andmeid saadakse allikast kätte
* [ ] Andmed laetakse `staging` kihti
* [x] Vähemalt üks transformatsioon toimib
* [x] Vähemalt üks näidikulaud on nähtaval
* [ ] Vähemalt üks andmekvaliteedi test läbib

Täpsustus:

* Launch Library API ühendus töötab.
* Andmed salvestatakse JSON kujul faili `data/raw/upcoming_launches.json`.
* Transformatsioon arvutab ettevõtete planeeritud startide arvu ja salvestab tulemuse faili `data/processed/company_launch_counts.csv`.
* Loodud on esimene visualiseerimine `output/top_companies.png`.

## Järgmised sammud

* Lisada Open-Meteo API andmed.
* Salvestada andmed PostgreSQL andmebaasi.
* Lisada andmekvaliteedi testid.
* Luua täiendavad visualiseerimised.

## Mis takistab

* Praegu puuduvad blokeerivad probleemid.
* Open-Meteo API integreerimine on planeeritud järgmisse sprinti.

## Kontrollpunkt

Käsk, millega saab kontrollida, et töövoog töötab:

```bash
python scripts/load_launches.py
python scripts/transform_launches.py
python scripts/create_chart.py
```

Oodatav tulemus:

* Tekib fail `data/raw/upcoming_launches.json`
* Tekib fail `data/processed/company_launch_counts.csv`
* Tekib fail `output/top_companies.png`
* Graafik kuvab ettevõtted planeeritud startide arvu järgi

```
```
