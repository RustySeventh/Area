from spotipy.oauth2 import SpotifyOAuth
from dotenv import load_dotenv
import os

load_dotenv()

SP_OAUTH = SpotifyOAuth(
    client_id=      os.environ.get('SPOTIPY_CLIENT_ID'),
    client_secret=  os.environ.get('SPOTIPY_CLIENT_SECRET'),
    redirect_uri=   os.environ.get('SPOTIPY_REDIRECT_URI'),
    scope=          "user-modify-playback-state user-read-playback-state playlist-modify-public playlist-modify-private")

def get_token(auth_code):
    try:
        response = SP_OAUTH.get_access_token(code=auth_code, as_dict=True, check_cache=False)
        return response
    except Exception as e:
        print(f"Error getting token: {e}")
        return None

def refresh_token(token):
    if token is None:
        return None
    try:
        if SP_OAUTH.is_token_expired(token):
            return SP_OAUTH.refresh_access_token(token['refresh_token'])
    except Exception as e:
        print(f"Error refreshing token: {e}")
        return None
    return token

def check_token(token):
    new_token = refresh_token(token)
    if new_token is not None: return new_token
    else: return None