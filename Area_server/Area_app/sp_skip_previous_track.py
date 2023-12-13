from spotipy import Spotify
from spotipy.oauth2 import SpotifyOAuth
from .spotify_utils import check_token

def skip_previous_track(token):
    token = check_token(token)
    if token is None:
        print("Error getting token")
        return False
    
    # Initialize the Spotipy object with OAuth2 authorization
    scope = "user-modify-playback-state user-read-playback-state"
    try:
        sp = Spotify(auth= token["access_token"], auth_manager=SpotifyOAuth(scope=scope))

        # List the devices
        devices = sp.devices()

        # If an active device is found, skip to the previous track
        for device in devices["devices"]:
            if device["is_active"]:
                sp.previous_track(device["id"])
                print("Skipped to previous track")
                return True
    except Exception as e:
        print(f"Error skipping to previous track: {e}")
    
    # If no active device is found, return False
    print("No active device found")
    return False
