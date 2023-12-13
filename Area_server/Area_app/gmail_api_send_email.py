# from .google_utils import Create_Service
# import base64
# from email.mime.multipart import MIMEMultipart
# from email.mime.text import MIMEText
# CLIENT_SECRET_FILE = '/app/Area_app/client_secret.json'
# API_NAME = 'gmail'
# API_VERSION = 'v1'
# SCOPES = ['https://mail.google.com/']

# service = Create_Service(CLIENT_SECRET_FILE, API_NAME, API_VERSION, SCOPES)

# def send_email(recipient, subject, body):
#     emailMsg = body
#     mimeMessage = MIMEMultipart()
#     mimeMessage['to'] = recipient
#     mimeMessage['subject'] = subject
#     mimeMessage.attach(MIMEText(emailMsg, 'plain'))
#     raw_string = base64.urlsafe_b64encode(mimeMessage.as_bytes()).decode()

#     service.users().messages().send(userId='me', body={'raw': raw_string}).execute()
