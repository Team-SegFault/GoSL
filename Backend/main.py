import requests
from fake_useragent import UserAgent
ua = UserAgent()

def get_interpol_notice(firstname, lastname):
    url = "https://ws-public.interpol.int/notices/v1/red"
    params = {
        'name': firstname,
        'forename': lastname
    }
    headers = {
        "accept": "application/json",
        "accept-encoding": "gzip, deflate, br, zstd",
        "accept-language": "en-US,en;q=0.9",
        "origin": "https://interpol.api.bund.dev",
        "priority": "u=1, i",
        "referer": "https://interpol.api.bund.dev/",
        "sec-ch-ua": '"Chromium";v="128", "Not;A=Brand";v="24", "Google Chrome";v="128"',
        "sec-ch-ua-mobile": "?0",
        "sec-ch-ua-platform": '"Windows"',
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "cross-site",
        "user-agent": str(ua.chrome)

    }
    
    with requests.Session() as session:
        session.headers.update(headers)
        response = session.get(url, params=params)
        if response.json()['total'] >= 1:
            return True
        else:
            return False

# Example usage:
# print(get_interpol_notice("Solide", "Manley"))