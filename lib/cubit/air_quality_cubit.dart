import 'package:bloc/bloc.dart';
import 'package:weather_app_1/cubit/air_quality_state.dart';
import 'package:weather_app_1/models/weather_air_quality.dart';
import 'package:weather_app_1/services/air_quality_service.dart';

class AirQualityCubit extends Cubit<AirQualityState> {
  final AirQualityService airQualityService = AirQualityService();

  AirQualityCubit() : super(AirQualityInitial());

  void fetchData({required String day}) async {
    emit(AirQualityLoading());

    await Future.delayed(const Duration(seconds: 3));

    WeatherAirQuality airQuality = await airQualityService.fetchQualityData(
      day: day,
    );

    emit(AirQualityLoaded(airQuality: airQuality));
  }
}
