from rest_framework.views import APIView
from Area_app.check_token import check_token
from django.http import JsonResponse
import os

DISCORD_LOGIN_URL="https://discord.com/api/oauth2/authorize?client_id=1168485631920451645&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fdiscord_callback&response_type=code&scope=identify%20messages.read%20email"
class discord_login(APIView):
    def get(self, request):
        user = check_token(request)
        if (user is None):
            return JsonResponse({
                'success': False,
                'message': "You're not logged in",
            }, status=401)
        return JsonResponse({
            'url': DISCORD_LOGIN_URL
        }, status=200)
