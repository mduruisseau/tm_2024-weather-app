import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_1/cubit/config_cubit.dart';
import 'package:weather_app_1/cubit/weather_cubit.dart';
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
  bool latValid = true;
  bool lngValid = true;

  final latController = TextEditingController(text: "50.6095001");
  final lngController = TextEditingController(text: "3.1337447");

  void fetchData(WeatherCubit cubit) async {
    double lat = double.parse(latController.text);
    double lng = double.parse(lngController.text);

    cubit.fetchData(lat: lat, lng: lng);
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
    WeatherCubit cubit = context.read<WeatherCubit>();
    ConfigCubit configCubit = context.read<ConfigCubit>();

    Widget? action;

    action = IconButton(
      onPressed: () {
        cubit.reset();
      },
      icon: const Icon(Icons.clear),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Météo"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: action,
        actions: [
          IconButton(
            onPressed: () {
              configCubit.toggleDarkMode();
            },
            icon: configCubit.state.isDarkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return buildForm(context);
            } else if (state is WeatherLoading) {
              return const CircularProgressIndicator();
            } else if (state is WeatherLoaded) {
              return WeatherDisplay(weatherData: state.weatherData);
            } else if (state is WeatherError) {
              return Text(state.message);
            }

            return Text("$state");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => fetchData(cubit),
        label: const Text("Rafraîchir"),
        icon: const Icon(Icons.refresh),
        disabledElevation: 0,
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
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
          onPressed: latValid && lngValid
              ? () {
                  fetchData(context.read<WeatherCubit>());
                }
              : null,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Charger les données"),
          ),
        ),
      ],
    );
  }
}
