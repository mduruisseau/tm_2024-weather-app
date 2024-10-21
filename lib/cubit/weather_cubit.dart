import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_1/models/weather_data.dart';
import 'package:weather_app_1/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService = WeatherService();

  WeatherCubit() : super(WeatherInitial());

  fetchData({
    required double lat,
    required double lng,
  }) async {
    emit(WeatherLoading());

    await Future.delayed(const Duration(seconds: 2));

    try {
      WeatherData data =
          await weatherService.fetchWeatherData(lat: lat, lng: lng);

      emit(WeatherLoaded(data));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  reset() {
    emit(WeatherInitial());
  }
}
