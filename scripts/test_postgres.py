from dotenv import load_dotenv
import os
from sqlalchemy import create_engine

load_dotenv(".env")

engine = create_engine(
    f"postgresql://{os.getenv('POSTGRES_USER')}:{os.getenv('POSTGRES_PASSWORD')}@localhost:{os.getenv('DB_PORT_HOST')}/{os.getenv('POSTGRES_DB')}"
)

with engine.connect() as conn:
    print("Ühendus PostgreSQL-iga töötab!")