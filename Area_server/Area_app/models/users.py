from django.db import models
from rest_framework import serializers
from django.contrib.auth.models import AbstractUser
import django.utils.timezone
import datetime

# Create your models here.

class customUser(AbstractUser):
    class Meta:
        app_label = 'Area_app'
    id = models.AutoField(primary_key=True)
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=50)
    token = models.TextField(default='')
    token_last_usage = models.DateTimeField(auto_now_add=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

class userSerializer(serializers.ModelSerializer):
    class Meta:
        model = customUser
        fields = '__all__'