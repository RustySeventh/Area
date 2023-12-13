"""Area_server URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
from Area_app.views.login_page import login_page
from Area_app.views.logout import log_out
from Area_app.views.register_user import register_user
from Area_app.views.about import about
from Area_app.views.up_triggers import up_triggers
from Area_app.views.get_user_data import get_user_data
from Area_app.views.spotify_login import spotify_login
from Area_app.views.spotify_callback import spotify_callback
from Area_app.views.discord_login import discord_login
from Area_app.views.discord_callback import discord_callback
from Area_app.views.google_login import google_login
from Area_app.views.google_callback import google_callback

from django.urls import include

urlpatterns = [
    # API calls
    path('api/login', login_page.as_view()),
    path('api/logout', log_out.as_view()),
    path('api/register', register_user.as_view()),
    path('api/update_triggers', up_triggers.as_view()),
    path('api/get_user_data', get_user_data.as_view()),

    # About page
    path('about.json', about.as_view()),
    path('accounts', include('allauth.urls')),

    # OAuth2
    # path('spotify_auth/', views.spotify_auth, name='spotify_auth'),

    # spotify
    # path('google_callback', spotify_auth),
    path('api/spotify_login', spotify_login.as_view()),
    path('spotify_callback', spotify_callback.as_view()),
    path('api/google_login', google_login.as_view()),
    path('google_callback', google_callback.as_view()),
    path('api/discord_login', discord_login.as_view()),
    path('discord_callback', discord_callback),
    # path('play_playback/', views.play_playback, name='play_playback'),
    # path('pause_playback/', views.pause_playback, name='pause_playback'),
    # path('skip_next_track/', views.skip_next_track, name='skip_next_track'),
    # path('skip_previous_track/', views.skip_previous_track, name='skip_previous_track'),
    # path('create_playlist/', views.create_playlist, name='create_playlist'),
    # path('delete_playlist/<str:playlist_id>/', views.delete_playlist, name='delete_playlist'),
    # path('add_to_queue/<str:track_uri>/', views.add_to_queue, name='add_to_queue')
]
