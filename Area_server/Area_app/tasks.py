from celery import shared_task
from Area_app.triggers import trig

@shared_task
def sample_task():
    trig()