from spotipy.oauth2 import SpotifyOAuth
from Area_app.check_token import check_token
from rest_framework.views import APIView
from django.http import JsonResponse
from django.http import HttpResponse
import os

class spotify_login(APIView):
    def get(self, request):
        user = check_token(request)
        if (user is None):
            return JsonResponse({
                'success': False,
                'message': "You're not logged in",
            }, status=401)
        sp_oauth = SpotifyOAuth(
        os.environ.get('SPOTIPY_CLIENT_ID'),
        os.environ.get('SPOTIPY_CLIENT_SECRET'),
        os.environ.get('SPOTIPY_REDIRECT_URI'),
        scope='user-library-read playlist-read-private playlist-modify-public playlist-modify-private user-modify-playback-state user-read-playback-state')
        return JsonResponse({
            'url': sp_oauth.get_authorize_url()
        }, status=200)
