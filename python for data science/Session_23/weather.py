import requests


# OpenWeatherMap API Key
API_KEY = "48a996864b0f82198ddb87fb4b235c78"


# City name
city = "Ahmedabad"


# API URL
url = (
    f"https://api.openweathermap.org/data/2.5/weather"
    f"?q={city}&appid={API_KEY}&units=metric"
)


# Send request
response = requests.get(url)


# Convert response to JSON
weather_data = response.json()


# Check response

if response.status_code == 200:

    temperature = weather_data["main"]["temp"]

    description = weather_data["weather"][0]["description"]

    humidity = weather_data["main"]["humidity"]


    print("Weather Report")
    print("---------------------")
    print("City:", city)
    print("Temperature:", temperature, "°C")
    print("Condition:", description)
    print("Humidity:", humidity, "%")


else:

    print("Error fetching weather data")
    print(weather_data)