import psycopg2
import os

try:
    conn = psycopg2.connect(
        dbname=os.environ.get('POSTGRES_DB'),
        user="postgres",
        password=os.environ.get('POSTGRES_PASSWORD'),
        host="db",
        port=5432
    )
    print("Database connection successful.")
except psycopg2.Error as e:
    print("Database connection error:", e)