import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weather_data.dart';
import 'package:weather_app_1/services/weather_service.dart';
import 'package:weather_app_1/views/widgets/coordinate_form_field.dart';
import 'package:weather_app_1/views/widgets/weather_display.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  bool firstFetch = true;
  bool loading = false;
  WeatherData? weatherData;

  bool latValid = true;
  bool lngValid = true;

  final latController = TextEditingController(text: "50.6095001");
  final lngController = TextEditingController(text: "3.1337447");

  void fetchData() async {
    setState(() {
      loading = true;

      if (!firstFetch) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Chargement en cours..."),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    WeatherData data = await WeatherService().fetchWeatherData(
      lat: double.parse(latController.text),
      lng: double.parse(lngController.text),
    );

    setState(() {
      weatherData = data;
      loading = false;
      firstFetch = false;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Chargement terminé !"),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  void reset() {
    setState(() {
      firstFetch = true;
      weatherData = null;
    });
  }

  @override
  void initState() {
    latController.addListener(() {
      setState(() {
        try {
          double.parse(latController.text);
          latValid = true;
        } catch (e) {
          latValid = false;
        }
      });
    });

    lngController.addListener(() {
      setState(() {
        try {
          double.parse(lngController.text);
          lngValid = true;
        } catch (e) {
          lngValid = false;
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    latController.dispose();
    lngController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = buildForm();

    if (firstFetch && loading) {
      content = const CircularProgressIndicator();
    } else if (weatherData != null) {
      content = WeatherDisplay(weatherData: weatherData!);
    } else if (!firstFetch) {
      content = const Text("Aucune donnée / erreur");
    }

    Widget? action;
    if (!firstFetch) {
      action = IconButton(
        onPressed: reset,
        icon: const Icon(Icons.clear),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Météo"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: action,
      ),
      body: Center(
        child: content,
      ),
      floatingActionButton: firstFetch
          ? null
          : FloatingActionButton.extended(
              onPressed: loading ? null : fetchData,
              label: loading
                  ? const CircularProgressIndicator()
                  : const Text("Rafraîchir"),
              icon: loading ? null : const Icon(Icons.refresh),
              disabledElevation: 0,
            ),
    );
  }

  Widget buildForm() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CoordinateFormField(
                    label: "Latitude",
                    controller: latController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CoordinateFormField(
                    label: "Longitude",
                    controller: lngController,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: latValid && lngValid ? fetchData : null,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Charger les données"),
          ),
        ),
      ],
    );
  }
}
