from django.shortcuts import render
from Area_app.models.reactions import *
from spotipy.oauth2 import SpotifyOAuth
from Area_app.models.users import customUser
from Area_app.models.auth import spotify_auth as sp_auth
from rest_framework.views import APIView
from Area_app.check_token import check_get_token

class spotify_callback(APIView):
    def get(self, request):
        if (request.GET.get('code') is not None and request.GET.get('state') is not None):
            sp_oauth = SpotifyOAuth(scope="user-library-read user-modify-playback-state user-read-playback-state \
                                        playlist-read-private playlist-modify-public playlist-modify-private")
            token_info = sp_oauth.get_access_token(request.GET.get("code"))
            # Store the access token in the session (user-specific)
            try:
                user = check_get_token(request.GET.get('state'))
                try:
                    auth = sp_auth.objects.get(user=user)
                except sp_auth.DoesNotExist:
                    auth = sp_auth()
                    auth.user = user
                auth.token = token_info
                auth.save()
                return(render(request, 'spotify_callback.html', {'authenticated': True}))
            except: #sp_auth.DoesNotExist:
                return(render(request, 'spotify_callback.html', {'authenticated': False, 'error': 'user not found'}))






    #     user = check_get_token(request.GET.get('area_token'))
    #     if (user is not None):
    #         token_url = "https://accounts.spotify.com/api/token"
    #         data = {
    #             "grant_type": "authorization_code",
    #             "code": request.GET.get('code'),
    #             "redirect_uri": os.environ.get('SPOTIPY_REDIRECT_URI'),
    #         }
    #         client_id = os.environ.get('SPOTIPY_CLIENT_ID')
    #         client_secret = os.environ.get('SPOTIPY_CLIENT_SECRET')

    #         # Concaténer le client_id et le client_secret avec un deux-points (:) entre eux
    #         auth_str = f"{client_id}:{client_secret}"

    #         # Encoder la chaîne en base64
    #         auth_b64 = base64.b64encode(auth_str.encode()).decode()

    #         # Inclure l'en-tête d'autorisation dans la demande
    #         headers = {
    #             "Authorization": f"Basic {auth_b64}"
    #         }
    #         response = requests.post(token_url, data=data, headers=headers)

    #         if response.status_code == 200:
    #             token_data = response.json()
    #             try:
    #                 auth = sp_auth.objects.get(id=1)
    #             except:
    #                 auth = sp_auth()
    #             auth.access_token = token_data["access_token"]
    #             auth.refresh_token = token_data.get("refresh_token", None)
    #             auth.save()
    #         else:
    #             print("Failed to retrieve tokens:", response.text)
    #             return(render(request, 'spotify_callback.html', {'authenticated': False, 'error': 'Failed to retrieve tokens'}))
    #     else:
    #         return(render(request, 'spotify_callback.html', {'authenticated': False, 'error': 'You are not logged in'}))
        else:
            return(render(request, 'spotify_callback.html', {'authenticated': False}))