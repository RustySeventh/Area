from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.decorators import permission_classes
from rest_framework.permissions import AllowAny
import time

@permission_classes([AllowAny])
class about(APIView):
    def get(self, request):
        host = request.META.get('HTTP_HOST')
        current_timestamp = int(time.time())
        return JsonResponse({
            "client": {
                "host": host
            },
            "server": {
                "current_time": current_timestamp,
                "services": [{
                    "name": "youtube",
                    "actions": [{
                        "name": "new_video",
                        "description": "Triggered when a new video is posted on a channel"
                    },
                    {
                        "name": "new_subscription",
                        "description": "Triggered when a new subscription is made to a channel"
                    }],
                    "reactions": [{}]
                },
                {
                    "name": "weather",
                    "actions": [{
                        "name": "compare",
                        "description": "Triggered when the weather is above, equal or below a certain temperature"
                    }],
                    "reactions": [{}]
                },
                {
                    "name": "timer",
                    "actions": [{
                        "name": "timer",
                        "description": "Triggered when a timer is finished"
                    }],
                    "reactions": [{}]
                },
                {
                    "name": "currency",
                    "actions": [{
                        "name": "compare",
                        "description": "Triggered when a currency is above or below a certain value"
                    }],
                    "reactions": [{}]
                },
                {
                    "name": "spotify",
                    "actions": [{}],
                    "reactions": [{
                        "name": "create_playlist",
                        "description": "Create a playlist"
                    },
                    {
                        "name": "delete_playlist",
                        "description": "Delete a playlist"
                    },
                    {
                        "name": "next",
                        "description": "Play the next song"
                    },
                    {
                        "name": "previous",
                        "description": "Play the previous song"
                    },
                    {
                        "name": "play",
                        "description": "Play a song"
                    },
                    {
                        "name": "pause",
                        "description": "Pause the current song"
                    },
                    {
                        "name": "add_to_queue",
                        "description": "Add a song to the queue"
                    }]
                },
                {
                    "name": "discord",
                    "actions": [{
                        "name": "new_private_message",
                        "description": "Triggered when a new message is received from a user"
                    }],
                    "reactions": [{
                        "name": "send_private_message",
                        "description": "Send a private message to a user"
                    },
                    {
                        "name": "send_message_in_server",
                        "description": "Send a message in a server channel"
                    }]
                }]
            }
        })

