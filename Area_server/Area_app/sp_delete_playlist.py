from spotipy import Spotify
from spotipy.oauth2 import SpotifyOAuth
from .spotify_utils import check_token

def get_playlist_id_by_name(sp:Spotify, playlist_name):
    # Get the current user's playlists
    playlists = sp.current_user_playlists()
    
    for playlist in playlists['items']:
        if playlist['name'] == playlist_name:
            return playlist['id']
    
    # If the playlist is not found, return None
    return None

def delete_playlist(token, playlist_name):
    token = check_token(token)
    if token is None:
        print("Error getting token")
        return False
    
    # Initialize the Spotipy object with OAuth2 authorization
    scope = "playlist-modify-public playlist-modify-private"
    sp = Spotify(auth= token["access_token"], auth_manager=SpotifyOAuth(scope=scope))

    # Get the playlist ID
    playlist_id = get_playlist_id_by_name(sp, playlist_name)
    if playlist_id is None:
        print(f"Playlist '{playlist_name}' not found.")
        return False

    # Get the user ID
    try:
        user_id = sp.me()["id"]
    except Exception as e:
        print(f"Error getting user ID: {e}")
        return False

    # Delete the playlist with the specified name
    try:
        sp.user_playlist_unfollow(user_id, playlist_id)
        print(f"Playlist deleted: (ID: {playlist_id})")
    except Exception as e:
        print(f"Error deleting playlist: {e}")
        return False
    return True
