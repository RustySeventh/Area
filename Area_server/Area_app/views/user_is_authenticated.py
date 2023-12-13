# from rest_framework.views import APIView
# from django.http import JsonResponse
# from Area_app.models.auth import *
# from Area_app.check_token import check_token

# class user_is_authenticated(APIView):
#     def get(self, request):
#         user = check_token(request)
#         if user is not None:
             
#         else:
#             return JsonResponse({
#                 'success': False,
#                 'message': 'You\'re not logged in',
#             }, status=401)