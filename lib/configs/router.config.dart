import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_1/models/weather_day.dart';
import 'package:weather_app_1/views/pages/weather_day_detail.dart';
import 'package:weather_app_1/views/pages/weather_home.dart';

class RoutesConfig {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WeatherHome(),
        routes: [
          GoRoute(
            path: 'details',
            builder: (context, state) {
              WeatherDay weatherDay =
                  WeatherDay.fromJson(jsonDecode(state.extra.toString()));
              return WeatherDayDetail(
                weatherDay: weatherDay,
              );
            },
          ),
        ],
      ),
    ],
    debugLogDiagnostics: true,
    initialLocation: '/',
  );
}
