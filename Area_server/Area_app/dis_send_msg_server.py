import requests
import json

def dis_send_msg_server(webhook_url, message):
    # Create a dictionary with the message content
    payload = { "content": message }

    # Convert the payload to JSON format
    data = json.dumps(payload)

    # Set the headers to specify JSON content
    headers = { "Content-Type": "application/json" }

    # Send the POST request to the webhook URL
    response = requests.post(webhook_url, data=data, headers=headers)

    # Check the response status
    if response.status_code == 204:
        print("Message sent successfully")
        return True
    else:
        print(f"Failed to send message. Status code: {response.status_code}")
        return False
