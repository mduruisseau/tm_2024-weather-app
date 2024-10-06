import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weather_data.dart';
import 'package:weather_app_1/services/weather_service.dart';
import 'package:weather_app_1/views/weather_info.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  bool firstFetch = true;
  bool loading = false;
  WeatherData? weatherData;

  void fetchData() async {
    setState(() {
      loading = true;
    });

    WeatherData data = await WeatherService().fetchWeatherData();

    setState(() {
      weatherData = data;
      loading = false;
      firstFetch = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ElevatedButton(
      onPressed: fetchData,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Charger les données"),
      ),
    );

    if (loading) {
      content = const CircularProgressIndicator();
    } else if (weatherData != null) {
      content = WeatherInfo(weatherData: weatherData!);
    } else if (!firstFetch) {
      content = const Text("Aucune donnée / erreur");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Météo"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: content,
      ),
      floatingActionButton: firstFetch
          ? null
          : FloatingActionButton.extended(
              onPressed: loading ? null : fetchData,
              label: const Text("Rafraîchir"),
              icon: const Icon(Icons.refresh),
              disabledElevation: 0,
            ),
    );
  }
}
