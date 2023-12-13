import requests

def get_cryptocurrency_price(crypto_symbol, fiat_currency='usd'):
    # CoinGecko API endpoint
    url = f'https://api.coingecko.com/api/v3/simple/price?ids={crypto_symbol}&vs_currencies={fiat_currency}'

    try:
        response = requests.get(url)
        data = response.json()

        if crypto_symbol in data and fiat_currency in data[crypto_symbol]:
            price = data[crypto_symbol][fiat_currency]
            return price

        return None
    except Exception as e:
        print(f"Error: {e}")
        return None

def cur_cmp(crypto_symbol, ref_value, eq, fiat_currency='usd'):
    crypto_price = get_cryptocurrency_price(crypto_symbol, fiat_currency)
    if crypto_price is not None:
        if eq == '>':
            return crypto_price > ref_value
        elif eq == '<':
            return crypto_price < ref_value
        elif eq == '=':
            return crypto_price == ref_value
    else:
        print(f"Error getting price for {crypto_symbol}")
        return False
