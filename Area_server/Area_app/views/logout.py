from django.http import JsonResponse
from rest_framework.views import APIView
from django.contrib.auth import logout
from Area_app.check_token import check_token

class log_out(APIView):
    def post(self, request):
        user = check_token(request)
        if (user is not None):
            user.token = ''
            user.save()
            return JsonResponse({
                'success': True,
                'message': 'Logout successful',
            }, status=200)
        else:
            return JsonResponse({
                'success': False,
                'message': 'You\'re not logged in',
            }, status=401)