from django.shortcuts import render
import requests
from Area_app.check_token import check_get_token
from Area_app.models.reactions import *
from spotipy.oauth2 import SpotifyOAuth
from Area_app.models.users import customUser
from Area_app.models.auth import discord_auth as disc_auth

DISCORD_CLIENT_ID="1168485631920451645"
DISCORD_CLIENT_SECRET="-8ORCSlcNwbjucCxxL1NimyaT9yml8wY"
DISCORD_REDIRECT_URI="http://localhost:8080/discord_callback"

def discord_callback(request):
    discord_code = request.GET.get('code')
    if (discord_code is not None and request.session['id']):
        token_info = exchange_code(discord_code)
        # Store the access token in the session (user-specific)
        if token_info is None:
            return(render(request, 'discord_callback.html', {'authenticated': False, 'error': 'Error while exchanging code'}))
        try:
            user = customUser.objects.get(id=request.session['id'])
            try:
                auth = disc_auth.objects.get(user=user)
            except disc_auth.DoesNotExist:
                auth = disc_auth()
                auth.user = user
            auth.access_token = token_info["access_token"]
            auth.refresh_token = token_info["refresh_token"]
            auth.save()
            return(render(request, 'discord_callback.html', {'authenticated': True}))
        except: #disc_auth.DoesNotExist:
            return(render(request, 'discord_callback.html', {'authenticated': False, 'error': 'user not found'}))
    else:
        return(render(request, 'discord_callback.html', {'authenticated': False, 'error': 'no code'}))

def exchange_code(code):
    token_url = "https://discord.com/api/v10/oauth2/token"
    data = {
        'client_id': DISCORD_CLIENT_ID,
        'client_secret': DISCORD_CLIENT_SECRET,
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': DISCORD_REDIRECT_URI,
    }
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
    }
    response = requests.post(token_url, data=data, headers=headers)

    if response.status_code == 200:
        token_data = response.json()
        return token_data
    else:
        # Handle the error
        return None