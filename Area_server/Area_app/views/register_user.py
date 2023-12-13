from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.decorators import permission_classes
from rest_framework.permissions import AllowAny
from Area_app.models.users import customUser
from rest_framework.authtoken.models import Token
from Area_app.models.actions import *
from Area_app.models.reactions import *
import datetime
import hashlib

@permission_classes([AllowAny])
class register_user(APIView):
    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')
        username = request.data.get('username')
        cuser = customUser.objects.filter(email=email)
        if cuser.exists():
            return JsonResponse({
                'success': False,
                'message': 'Email already exists'
            }, status=401)
        if email is not None and password is not None and username is not None:
            usr = customUser.objects.create_user(email=email, username=username)
            usr.set_password(password)
            token, created = Token.objects.get_or_create(user=usr)
            hashed_token = hashlib.sha256(token.key.encode()).hexdigest()
            usr.token = hashed_token
            usr.save()
            return JsonResponse({
                'success': True,
                'token': token.key,
                'message': 'User created',
            }, status=200)
        else:
            return JsonResponse({
                'success': False,
                'message': 'At least one field is empty'
            }, status=401)