from django.db import models
from Area_app.sp_create_playlist import create_playlist
from Area_app.sp_delete_playlist import delete_playlist
from Area_app.sp_skip_next_track import skip_next_track
from Area_app.sp_skip_previous_track import skip_previous_track
from Area_app.sp_play_playback import play_playback
from Area_app.sp_pause_playback import pause_playback
from Area_app.sp_add_to_queue import add_to_queue
from Area_app.dis_send_dm import dis_send_dm
from Area_app.dis_send_msg_server import dis_send_msg_server
from Area_app.models.users import customUser
from Area_app.models.auth import spotify_auth as sp_auth

class reaction(models.Model):
    class Meta:
        app_label = 'Area_app'
        abstract = True
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(customUser, on_delete=models.CASCADE)
    area_id = models.IntegerField(default=0)

    def start_reaction(self):
        raise NotImplementedError("Please Implement this method")

class spotify(reaction):
    class Meta:
        app_label = 'Area_app'
        abstract = True

class spotify_create_playlist(spotify):
    class Meta:
        app_label = 'Area_app'
    name = models.TextField(default="")
    description = models.TextField(default="")
    public = models.BooleanField(default=False)

    def start_reaction(self):
        sp = sp_auth.objects.get(user=self.user)
        create_playlist(sp.token, self.name, self.public, self.description)

class spotify_delete_playlist(spotify):
    class Meta:
        app_label = 'Area_app'
    name = models.TextField(default="")

    def start_reaction(self):
        sp = sp_auth.objects.get(user=self.user)
        delete_playlist(sp.token, self.name)

class spotify_next(spotify):
    class Meta:
        app_label = 'Area_app'

    def start_reaction(self):
        sp = sp_auth.objects.get(user=self.user)
        skip_next_track(sp.token)

class spotify_previous(spotify):
    class Meta:
        app_label = 'Area_app'

    def start_reaction(self):
        sp = sp_auth.objects.get(user=self.user)
        skip_previous_track(sp.token)

class spotify_play(reaction):
    class Meta:
        app_label = 'Area_app'

    def start_reaction(self):
        sp = sp_auth.objects.get(user=self.user)
        play_playback(sp.token)

class spotify_pause(spotify):
    class Meta:
        app_label = 'Area_app'

    def start_reaction(self):
        sp = sp_auth.objects.get(user=self.user)
        pause_playback(sp.token)

class spotify_add_to_queue(spotify):
    class Meta:
        app_label = 'Area_app'
    track = models.TextField(default="")

    def start_reaction(self):
        sp = sp_auth.objects.get(user=self.user)
        add_to_queue(sp.token, self.track)

class discord_send_dm(reaction):
    class Meta:
        app_label = 'Area_app'

    # Rien à voir avec l'Oauth2, c'est juste pour pouvoir envoyer des messages privés
    token = models.TextField(default="MjQyMjg3OTkyMDIxMDU3NTM2.GmWxsB.IzM03waYFGTCP6ybNbSlrl9KIOUxyWxWTPSfXw")
    recipient = models.TextField(default="")
    content = models.TextField(default="")

    def start_reaction(self):
        dis_send_dm(self.token, self.recipient, self.content)

class discord_send_msg_server(reaction):
    class Meta:
        app_label = 'Area_app'
    webhook_url = models.TextField(default="")
    content = models.TextField(default="")

    def start_reaction(self):
        dis_send_msg_server(self.webhook_url, self.content)
