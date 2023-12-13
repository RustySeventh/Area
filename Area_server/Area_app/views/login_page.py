from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.decorators import permission_classes
from rest_framework.permissions import AllowAny
from django.contrib.auth import authenticate, login
from rest_framework.authtoken.models import Token
import hashlib

@permission_classes([AllowAny])
class login_page(APIView):
    def post(self, request):
        if (request.user.is_authenticated):
            return JsonResponse({
                'success': False,
                'message': 'You\'re already connected',
            }, status=401)
        email = request.data.get('email')
        password = request.data.get('password')
        usr = authenticate(request, email=email, password=password)
        if usr is not None:
            token, created = Token.objects.get_or_create(user=usr)
            hashed_token = hashlib.sha256(token.key.encode()).hexdigest()
            usr.token = hashed_token
            usr.save()
            return JsonResponse({
                'success': True,
                'token': token.key,
                'message': 'Login successful',
            }, status=200)
        else:
            return JsonResponse({
                'success': False,
                'message': 'Wrong email or password'
            }, status=401)