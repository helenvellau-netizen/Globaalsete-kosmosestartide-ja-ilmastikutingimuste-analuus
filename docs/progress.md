# Sprint 2 edenemine

## Mis on valmis

* Launch Library API ühendus on testitud ja töötab.
* Loodud sissevõtu skript `load_launches.py`, mis salvestab API andmed JSON kujul.
* Loodud transformatsiooni skript `transform_launches.py`, mis arvutab ettevõtete planeeritud startide arvu.
* Loodud visualiseerimine `create_chart.py`, mis kuvab ettevõtete planeeritud startide arvu graafikuna.
* Andmevoog töötab otsast lõpuni (API → JSON → CSV → graafik).

## Järgmised sammud

* Lisada Open-Meteo API andmed.
* Salvestada andmed PostgreSQL andmebaasi.
* Täiendada visualiseerimisi ilmastikuriski analüüsiga.
* Luua täiendavad mõõdikud ja filtrid.

## Mis takistab

Hetkel puuduvad blokeerivad probleemid.

## Kontrollpunkt

Töötav andmevoog:

Launch Library API → upcoming_launches.json → company_launch_counts.csv → top_companies.png

Kontrollitavad failid:

* `data/raw/upcoming_launches.json`
* `data/processed/company_launch_counts.csv`
* `output/top_companies.png`
