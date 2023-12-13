from django.http import JsonResponse
from rest_framework.views import APIView
from Area_app.models.reactions import *
from Area_app.models.actions import *
from Area_app.check_token import check_token
from django.apps import apps

def create_areas(user, area):
    id = area["id"]
    act = area["action"]
    react = area["reaction"]
    a = apps.get_model('Area_app', act["name"])
    action = a()
    action.user = user
    action.active = act['active']
    for key, value in act['data'].items():
        if value == "true":
            value = True
        elif value == "false":
            value = False
        setattr(action, key, value)
    action.area_id = id
    action.rea_name = react["name"]
    action.area_json = area
    action.save()

    r = apps.get_model('Area_app', react["name"])
    reaction = r()
    for key, value in react['data'].items():
        if value == "true":
            value = True
        elif value == "false":
            value = False
        setattr(reaction, key, value)
    reaction.area_id = id
    reaction.user = user
    reaction.save()
    setattr(action, reaction.__class__.__name__.lower(), reaction)
    action.save()

def update_areas(user, area):
    id = area["id"]
    act = area["action"]
    react = area["reaction"]
    a = apps.get_model('Area_app', act["name"]).objects.get(area_id=id, user=user)
    for key, value in act['data'].items():
        if value == "true":
            value = True
        elif value == "false":
            value = False
        setattr(a, key, value)
    a.active = act['active']
    a.area_json = area
    a.save()

    r = apps.get_model('Area_app', react["name"]).objects.get(area_id=id, user=user)
    for key, value in react['data'].items():
        if value == "true":
            value = True
        elif value == "false":
            value = False
        setattr(r, key, value)
    r.save()

def assign_triggers(user, request):
    actions = [yt_new_video, yt_new_subscription, weather_comp, timer, currency, discord_new_dm]
    for area in request.data:
        id = area["id"]
        try:
            apps.get_model('Area_app', area["action"]["name"]).objects.get(area_id=id, user=user)
            apps.get_model('Area_app', area["reaction"]["name"]).objects.get(area_id=id, user=user)
            update_areas(user, area)
        except:
            for action in actions:
                try:
                    action.objects.get(area_id=id, user=user).delete()
                except:
                    pass
            create_areas(user, area)

class up_triggers(APIView):
    def post(self, request):
        user = check_token(request)
        if (user is not None):
            assign_triggers(user, request)
            return JsonResponse({
                'success': True,
                'message': 'Triggers updated',
            }, status=200)
        else:
            return JsonResponse({
                'success': False,
                'message': 'You\'re not logged in',
            }, status=401)