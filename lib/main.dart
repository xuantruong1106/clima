import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'weather_service.dart';
import 'location_service.dart';

void main() => runApp(ClimaApp());

class ClimaApp extends StatelessWidget {
  const ClimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima',
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final _weatherService = WeatherService();
  final _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _getLocationAndWeather();
  }

  _getLocationAndWeather() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      // Check if location permission is granted
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permission denied');
        }
      }

      // Get the current location
      Position position = await _locationService.getCurrentLocation();
      Map<String, dynamic> weatherData =
          await _weatherService.getWeather('London'); // For now, replace with a city name

      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(weatherData, weatherService: _weatherService),
        ),
      );
    } catch (e) {
      print(e); // Handle errors (e.g., permissions, location fetching)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.blue,
          size: 100.0,
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  final Map<String, dynamic> weatherData;
  final WeatherService weatherService;

  MainScreen(this.weatherData, {super.key, required this.weatherService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherData['name'],
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              '${weatherData['main']['temp']}°C',
              style: TextStyle(fontSize: 64),
            ),
            Text(
              weatherData['weather'][0]['description'],
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter city name'),
              onSubmitted: (value) async {
                Map<String, dynamic> newWeatherData =
                    await weatherService.getWeather(value);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(newWeatherData, weatherService: weatherService),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
