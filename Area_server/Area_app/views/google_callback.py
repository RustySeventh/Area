from django.shortcuts import render
from Area_app.check_token import check_get_token
from Area_app.models.reactions import *
from rest_framework.authtoken.models import Token
from rest_framework.views import APIView
import hashlib
import base64
import requests
import os

class google_callback(APIView):
    def get(self, request):
        if (request.GET.get('code') is not None):
            user = customUser()
            token, created = Token.objects.get_or_create(user=user)
            hashed_token = hashlib.sha256(token.key.encode()).hexdigest()
            user.token = hashed_token
            user.save()
            return(render(request, 'google_callback.html', {'authenticated': True}))