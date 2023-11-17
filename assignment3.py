import requests

def get_api_data(api_url):
    try:
        response = requests.get(api_url)
        response.raise_for_status()
        data = response.json()
        return data
    except requests.RequestException as e:
        print(f"Request Exception: {e}")
        return None
    except ValueError as e:
        print(f"Error parsing JSON: {e}")
        return None

def display_information(api_data):
    if api_data:
        ip_address = api_data.get('ip')

        city = api_data.get('city')
        region = api_data.get('region')
        country = api_data.get('country')
        timezone = api_data.get('timezone')

        print("IP Address:", ip_address)
        print(f"City: {city}")
        print(f"Region: {region}")
        print(f"Country: {country}")
        print(f"Timezone: {timezone}")
    else:
        print("Failed to fetch or extract data from the API.")

api_url = 'https://ipapi.co/json'
api_data = get_api_data(api_url)

display_information(api_data)