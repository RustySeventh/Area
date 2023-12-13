from googleapiclient.discovery import build
from datetime import datetime, timedelta
from googleapiclient.errors import HttpError
import sys
import os

# def get_channel_id_from_username(username):
#     # Create an API client
#     key = "AIzaSyDncliqgJsRoE5CzfgIecq8KluwNQJbudg"
#     youtube = build('youtube', 'v3', developerKey=key)

#     # Call the YouTube Analytics API to retrieve the channel's analytics data
#     try:
#         response = youtube.channels().list(
#         part="snippet,contentDetails,statistics",
#         forUsername=username,
#     ).execute()
#     except HttpError as e:
#         print(e)
#         return False
#     print(response)
#     if not 'items' in response:
#         print("Username '" + username + "' not found")
#         return None
#     return(response['items'][0]['id'])

def check_new_videos(channel_id):
    # Obtenez l'ID de la chaîne à partir du nom d'utilisateur
    api_key = os.environ.get("YTB_PUB_API_KEY")
    # channel_id = get_channel_id_from_username(username)
    if channel_id is None:
        return False

    # Créez un client API
    youtube = build('youtube', 'v3', developerKey=api_key)

    # Récupérez la liste des vidéos les plus récentes de la chaîne
    try:
        response = youtube.search().list(
        channelId=channel_id,
        part="snippet",
        maxResults=1,
        order="date",
        type="video"
    ).execute()
    except HttpError as e:
        print(e)
        return False
    print("--------")
    print(response)
    if 'items' in response and len(response['items']) > 0:
        # Extrait la date de publication de la vidéo la plus récente
        video_date = datetime.strptime(response['items'][0]['snippet']['publishedAt'], "%Y-%m-%dT%H:%M:%SZ")

        # Calcule la différence entre la date actuelle et la date de publication
        time_difference = datetime.now() - video_date

        # Vérifie si la vidéo a été publiée dans les X dernières minutes
        if time_difference <= timedelta(minutes=10):
            print("New video found")
            return True
        else:
            print("No new video found, last video: " + str(time_difference) + " ago")
            return False
    else:
        # Aucune vidéo trouvée
        print("No video found")
        return False