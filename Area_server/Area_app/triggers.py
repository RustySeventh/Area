from Area_app.models.users import customUser
import logging as log
from Area_app.models.actions import *
from django.utils import timezone
from datetime import timedelta

def trig():
    userlist = customUser.objects.all()
    log.info("----------checking triggers----------")
    if (userlist is not None):
        for user in userlist:
            now = timezone.now()
            if (now - user.token_last_usage == timedelta(minutes=30)):
                user.token = ""
                user.save()
                log.info("user: " + user.username + " logged out, token expired")
                continue
            log.info("user: " + user.username)
            actions = [yt_new_video.objects.filter(user=user), yt_new_subscription.objects.filter(user=user), weather_comp.objects.filter(user=user), timer.objects.filter(user=user), currency.objects.filter(user=user), discord_new_dm.objects.filter(user=user)]
            for action in actions:
                for a in action:
                    if a.active:
                        log.info("area: " + a.__class__.__name__ + " --> " + a.rea_name.lower())
                        if (a.start_action()):
                            getattr(a, a.rea_name.lower()).start_reaction()
    else:
        log.info("no user found")
    log.info("-----------Triggers checked----------")
