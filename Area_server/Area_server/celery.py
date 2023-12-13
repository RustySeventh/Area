import os

from celery import Celery


os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Area_server.settings")

app = Celery("Area_app")
app.config_from_object("django.conf:settings", namespace="CELERY")
app.autodiscover_tasks()