import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_1/cubit/config_cubit.dart';
import 'package:weather_app_1/cubit/weather_cubit.dart';
import 'package:weather_app_1/cubit/weather_day_cubit.dart';
import 'package:weather_app_1/configs/router.config.dart';

void main() async {
  await initializeDateFormatting('fr_FR', null);
  Intl.defaultLocale = 'fr_FR';

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConfigCubit>(
          create: (context) => ConfigCubit(),
        ),
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(),
        ),
        BlocProvider<WeatherDayCubit>(
          create: (context) => WeatherDayCubit(),
        ),
      ],
      child: BlocBuilder<ConfigCubit, ConfigState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: state.isDarkMode
                  ? const ColorScheme.dark()
                  : ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            routerConfig: RoutesConfig.routes,
          );
        },
      ),
    );
  }
}
