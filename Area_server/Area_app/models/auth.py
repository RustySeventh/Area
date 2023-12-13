from django.db import models
from Area_app.models.users import customUser

class spotify_auth(models.Model):
    class Meta:
        app_label = 'Area_app'

    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(customUser, on_delete=models.CASCADE)
    access_token = models.TextField(default="")
    refresh_token = models.TextField(default="")
    token = models.JSONField(default=None)

class discord_auth(models.Model):
    class Meta:
        app_label = 'Area_app'

    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(customUser, on_delete=models.CASCADE)
    access_token = models.TextField(default="")
    refresh_token = models.TextField(default="")