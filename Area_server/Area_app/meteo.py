import requests
import os

def check_meteo(city, temperature, eq):
    key = os.environ.get("METEO_API_KEY")
    response = requests.get("http://api.openweathermap.org/data/2.5/weather?q=" + city + "&APPID=" + key)
    ltmp = round(response.json()["main"]["temp"] - 273.15)
    if (ltmp > temperature and eq == 1):
        return True
    if (ltmp < temperature and eq == -1):
        return True
    if (ltmp == temperature and eq == 0):
        return True
    return False
