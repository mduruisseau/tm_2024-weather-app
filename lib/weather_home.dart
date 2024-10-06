import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  dynamic fetchWeatherData() async {
    Dio dio = Dio();

    const lat = 50.6095001;
    const lng = 3.1337447;

    var response = await dio.get(
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lng&current_weather=true');

    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Météo"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: FutureBuilder<dynamic>(
          future: fetchWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                  "Température : ${snapshot.data!['current_weather']['temperature']} °C");
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
