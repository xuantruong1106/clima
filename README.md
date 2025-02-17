# Clima - Weather App

Clima is a Flutter application that displays weather data from the OpenWeatherMap API. Users can either check the weather by entering a city name or allow the app to automatically fetch the weather based on their current location.

## 📌 Features
- ✅ Fetch weather data by city name.
- ✅ Automatically retrieve weather based on the user's current location using Geolocator.
- ✅ Displays weather description, temperature, and city name.
- ✅ Handles location permissions and services.
- ✅ Reusable widgets for weather data display.

## 📂 Project Structure
```
/bmi_calculator
│── /lib
|   ├── weather_service.dart │
│   ├── main.dart
|   ├── location_service.dart
│── pubspec.yaml
│── README.md
```

## 🚀 Installation & Run

1️⃣ **Clone the repository**:
```bash
git clone https://github.com/yourusername/clima.git
cd clima
```

2️⃣ **Install dependencies**:
```bash
flutter pub get
```

3️⃣ **Add your OpenWeatherMap API Key**:
- Create an account on [OpenWeatherMap](https://openweathermap.org/).
- Generate an API key from the [API Keys section](https://home.openweathermap.org/api_keys).
- Replace the placeholder `'YOUR_API_KEY'` in the code with your actual API key.

In the `weather_service.dart` file:
```dart
final String apiKey = 'YOUR_API_KEY';  // Replace with your API key
```

4️⃣ **Run the app**:
```bash
flutter run
```

## 📌 System Requirements
- Flutter SDK
- Dart
- Android/iOS device or emulator

## 📷 App Preview
![image](https://github.com/user-attachments/assets/a032ba8c-3bc6-48e0-a734-337c8cad26d0)

## 📜 License
This project is released under the MIT License. Feel free to use and modify it as needed.
```

### Notes:
- Replace `yourusername` with your actual GitHub username.
- For the app preview image, replace `image` with the path to the actual image you want to display (e.g., a screenshot or an image URL).
