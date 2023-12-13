import requests

def get_message_history(token, channel_id):
    url = f"https://discord.com/api/v10/channels/{channel_id}/messages"
    
    params = { 'limit': 1 }
    
    headers = { 'Authorization': token }
    
    response = requests.get(url, params=params, headers=headers)
    
    if response.status_code == 200:
        messages = response.json()
        return messages
    else:
        return None

def dis_new_dm(access_token, data, channel_id):
    if data.last_message is None:
        new_messages = get_message_history(access_token, channel_id)
        if new_messages is not None and len(new_messages) > 0:
            data.last_message = get_message_history(access_token, channel_id)[0].get("id")
            # print(f"New last message ID: {last_message_id}")
            return True
        else:
            # print("Error retrieving message history")
            return False
    else:
        new_messages = get_message_history(access_token, channel_id)
        # print(f"New messages: {new_messages}")
        if new_messages is not None and len(new_messages) > 0:
            if new_messages[0].get("id") is not last_message_id:
                last_message_id = new_messages[0].get("id")
                # print(f"New last message ID: {last_message_id}")
                return True
            else:
                # print("No new messages since last update")
                return False
        else:
            # print("No new messages since last update")
            return False
