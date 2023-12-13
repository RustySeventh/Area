from spotipy import Spotify
from spotipy.oauth2 import SpotifyOAuth
from .spotify_utils import check_token

def create_playlist(token, playlist_name, public=False, description=""):
    token = check_token(token)
    if token is None:
        print("Error getting token")
        return False
    
    # Initialize the Spotipy object with OAuth2 authorization
    scope = "playlist-modify-public playlist-modify-private"
    sp = Spotify(auth= token["access_token"], auth_manager=SpotifyOAuth(scope=scope))

    # Get the user ID
    try:
        user_id = sp.me()["id"]
    except Exception as e:
        print(f"Error getting user ID: {e}")
        return False

    # Create an empty playlist with the desired name
    try:
        playlist = sp.user_playlist_create(user_id, playlist_name, public, description=description)
        print(f"Playlist created: {playlist['name']} (ID: {playlist['id']})")
    except Exception as e:
        print(f"Error creating playlist: {e}")
        return False
    return True
