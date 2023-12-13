import requests

def send_dm(token, channel_id, message):
    url = f"https://discord.com/api/v10/channels/{channel_id}/messages"
    data = {"content": message}
    header = {"authorization": token}
 
    r = requests.post(url, data=data, headers=header)
    if (r.status_code == 200): 
        # print("Message sent successfully")
        return True
    else:
        # print("Failed to send message.")
        return False

def create_dm_channel(token, user_id):
    data = {"recipient_id": user_id}
    headers = {"authorization": token}
 
    r = requests.post(f'https://discord.com/api/v10/users/@me/channels', json=data, headers=headers)
    # print(r.status_code)
 
    if (r.status_code == 200):
        channel_id = r.json()['id']
        return channel_id
    else:
        # print("Failed to create DM channel.")
        return None

def dis_send_dm(token, user_id, message, channel_id=None):
    # print(f"MY CHANNEL ID: {channel_id}")

    if (channel_id is not None):
        if (send_dm(token, channel_id, message)): return True
        else:
            # print("Wrong channel ID.")
            return False
    
    channel_id = create_dm_channel(token, user_id)
    # print(f"NEW CHANNEL ID: {channel_id}")

    if (channel_id == None): return False
    if (send_dm(token, channel_id, message)): return True
    else: return False
