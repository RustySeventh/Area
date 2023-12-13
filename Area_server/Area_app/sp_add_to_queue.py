from spotipy import Spotify
from spotipy.oauth2 import SpotifyOAuth
from .spotify_utils import check_token

def get_track_id_by_name(sp:Spotify, track_name):
    results = sp.search(q=track_name, type='track', limit=1)
    
    # Check if there are any search results
    if results['tracks']['total'] > 0:
        track_id = results['tracks']['items'][0]['uri']
        return track_id
    else:
        return None

def add_to_queue(token, track_name):
    token = check_token(token)
    if token is None:
        print("Error getting token")
        return False
    
    # Initialize the Spotipy object with OAuth2 authorization
    scope = "user-modify-playback-state user-read-playback-state"
    try:
        sp = Spotify(auth= token["access_token"], auth_manager=SpotifyOAuth(scope=scope))
        # Get the track ID
        track_id = get_track_id_by_name(sp, track_name)
        if track_id is None:
            print(f"Track '{track_name}' not found.")
            return False
        
        # List the devices
        devices = sp.devices()

        for device in devices["devices"]:
            if device["is_active"]:
                # Add the song to the queue
                try:
                    sp.add_to_queue(track_id, device["id"])
                    print(f"Added song to the queue")
                    return True
                except Exception as e:
                    print(f"Error adding song to the queue: {e}")
                    return False
    except Exception as e:
        print(f"Error adding song to the queue: {e}")
        return False
    
    # If no active device is found, return False
    print("No active device found")
    return False
