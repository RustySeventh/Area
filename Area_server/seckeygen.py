import secrets
import string
import os

# Générer une clé secrète aléatoire de 50 caractères
def generate_secret_key(length=50):
    alphabet = string.ascii_letters + string.digits + string.punctuation
    secret_key = ''.join(secrets.choice(alphabet) for _ in range(length))
    return secret_key

# Utilisez la fonction pour générer une clé secrète


os.environ['SECRET_KEY'] = generate_secret_key()