import 'package:weather_app_1/models/weather_air_quality.dart';

abstract class AirQualityState {}

class AirQualityInitial extends AirQualityState {}

class AirQualityLoading extends AirQualityState {}

class AirQualityLoaded extends AirQualityState {
  final WeatherAirQuality airQuality;

  AirQualityLoaded({required this.airQuality});
}
