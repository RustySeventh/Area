from django.db import models
from Area_app.yt_api_channel_analytics import check_new_videos
from Area_app.meteo import check_meteo
from Area_app.cur_cmp import cur_cmp
from Area_app.time import timer as timer_fc
from Area_app.dis_new_dm import dis_new_dm
import logging as log
from Area_app.models.users import customUser
from Area_app.models.reactions import *
import json

# Create your models here.

class action(models.Model):
    class Meta:
        app_label = 'Area_app'
        abstract = True
    id = models.AutoField(primary_key=True)
    area_id = models.IntegerField(default=0)
    rea_name = models.CharField(max_length=50, default="")
    user = models.ForeignKey(customUser, on_delete=models.CASCADE)
    active = models.BooleanField(default=False)
    area_json = models.TextField(default="")

    spotify_create_playlist = models.ForeignKey(spotify_create_playlist, on_delete=models.CASCADE, null=True, blank=True)
    spotify_delete_playlist = models.ForeignKey(spotify_delete_playlist, on_delete=models.CASCADE, null=True, blank=True)
    spotify_next = models.ForeignKey(spotify_next, on_delete=models.CASCADE, null=True, blank=True)
    spotify_previous = models.ForeignKey(spotify_previous, on_delete=models.CASCADE, null=True, blank=True)
    spotify_play = models.ForeignKey(spotify_play, on_delete=models.CASCADE, null=True, blank=True)
    spotify_pause = models.ForeignKey(spotify_pause, on_delete=models.CASCADE, null=True, blank=True)
    spotify_add_to_queue = models.ForeignKey(spotify_add_to_queue, on_delete=models.CASCADE, null=True, blank=True)
    discord_send_dm = models.ForeignKey(discord_send_dm, on_delete=models.CASCADE, null=True, blank=True)
    discord_send_msg_server = models.ForeignKey(discord_send_msg_server, on_delete=models.CASCADE, null=True, blank=True)

    def natural_key(self):
        return(self.area_id)

    def start_action(self):
        raise NotImplementedError("Please Implement this method")

class yt_new_video(action):
    class Meta:
        app_label = 'Area_app'
    channel_name = models.TextField(default="")

    def start_action(self):
        if check_new_videos(self.channel_name):
            log.info("action detected, triggering reaction")
            return(True)
        return(False)

class yt_new_subscription(action):
    class Meta:
        app_label = 'Area_app'
    channel_name = models.TextField(default="")

    def start_action(self):
        return(False)

class weather_comp(action):
    class Meta:
        app_label = 'Area_app'
    city = models.CharField(max_length=50, default="")
    temperature = models.IntegerField(default=0)
    eq = models.IntegerField(default=0)

    def start_action(self):
        if check_meteo(self.city, self.temperature, self.eq):
            log.info("action detected, triggering reaction")
            return(True)
        return(False)

class timer(action):
    class Meta:
        app_label = 'Area_app'
    start_time = models.DateTimeField(null=True, blank=True)
    timeout_seconds = models.PositiveIntegerField(default=0)
    repeat = models.BooleanField(default=False)
    hours = models.IntegerField(default=0)
    minutes = models.IntegerField(default=0)
    seconds = models.IntegerField(default=0)

    def start_action(self):
        seconds_total = self.hours*3600 + self.minutes*60 + self.seconds
        if (timer_fc(self, seconds_total)):
            log.info("action detected, triggering reaction")
            return(True)
        return(False)

class currency(action):
    class Meta:
        app_label = 'Area_app'
    currency = models.CharField(max_length=50, default="")
    value = models.IntegerField(default=0)
    eq = models.IntegerField(default=1)
    fiat_currency = models.CharField(max_length=50, default="")

    def start_action(self):
        if (cur_cmp(self.currency, self.value, self.eq, self.fiat_currency)):
            log.info("action detected, triggering reaction")
            return(True)
        return(False)
    
class discord_new_dm(action):
    class Meta:
        app_label = 'Area_app'
    token = models.TextField(default="MjQyMjg3OTkyMDIxMDU3NTM2.GmWxsB.IzM03waYFGTCP6ybNbSlrl9KIOUxyWxWTPSfXw")
    last_message = models.TextField(default=None)
    channel_id = models.TextField(default="")

    def start_action(self):
        if (dis_new_dm(self.token, self, self.channel_id)):
            log.info("action detected, triggering reaction")
            return(True)
        return(False)
