from Area_app.check_token import check_token
from rest_framework.views import APIView
from django.http import JsonResponse
import os
import google.oauth2.credentials
import google_auth_oauthlib.flow


class google_login(APIView):
    def get(self, request):
        CLIENT_ID = os.environ.get('GOOGLE_CLIENT_ID')
        redirect_uri = "http://localhost:8080/google_callback"
        authorization_url = f"https://accounts.google.com/o/oauth2/auth?response_type=code&redirect_uri={redirect_uri}&client_id={CLIENT_ID}&scope=https://www.googleapis.com/auth/plus.login&access_type=offline"
        return JsonResponse({
            'url': authorization_url
        }, status=200)
