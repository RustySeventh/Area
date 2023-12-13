#!/bin/sh

while ! nc -z db 5432; do
    sleep 0.1
done
echo "PostgreSQL started"
python3 check_db.py
python3 manage.py makemigrations
python3 manage.py migrate
exec "$@"
