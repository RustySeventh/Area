from django.http import JsonResponse
from rest_framework.views import APIView
from Area_app.check_token import check_token
from Area_app.models.actions import *

class get_user_data(APIView):
    def get(self, request):
        user = check_token(request)
        if (user is not None):
            jsonlist = []
            action_list = [yt_new_video.objects.filter(user=user), yt_new_subscription.objects.filter(user=user), weather_comp.objects.filter(user=user), timer.objects.filter(user=user), currency.objects.filter(user=user), discord_new_dm.objects.filter(user=user)]
            for action in action_list:
                if (action is not None):
                    for nb in action:
                        jsonlist.append(nb.area_json)
            print(jsonlist)
            return JsonResponse(jsonlist, safe=False, status=200)
        else:
            return JsonResponse({
                'success': False,
                'message': "You're not logged in",
            }, status=401)