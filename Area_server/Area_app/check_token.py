from Area_app.models import customUser
import django.utils.timezone
import hashlib

def check_token(request):
    token = request.META.get('HTTP_AUTHORIZATION')
    if token:
        parts = token.split()
        if len(parts) == 2 and parts[0].lower() == "token":
            token = parts[1]
        hashed_token = hashlib.sha256(token.encode()).hexdigest()
        try:
            user = customUser.objects.get(token=hashed_token)
            user.token_last_usage = django.utils.timezone.now()
            return user
        except customUser.DoesNotExist:
            return None
    else:
        return None

def check_get_token(token):
    if token:
        parts = token.split()
        if len(parts) == 2 and parts[0].lower() == "token":
            token = parts[1]
        hashed_token = hashlib.sha256(token.encode()).hexdigest()
        try:
            user = customUser.objects.get(token=hashed_token)
            user.token_last_usage = django.utils.timezone.now()
            return user
        except customUser.DoesNotExist:
            return None
    else:
        return None