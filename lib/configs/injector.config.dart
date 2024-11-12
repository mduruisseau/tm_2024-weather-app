// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:weather_app_1/cubit/weather_cubit.dart' as _i438;
import 'package:weather_app_1/di/http_module.dart' as _i56;
import 'package:weather_app_1/services/air_quality_service.dart' as _i187;
import 'package:weather_app_1/services/weather_service.dart' as _i670;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final httpModule = _$HttpModule();
    gh.singleton<_i361.Dio>(() => httpModule.dio());
    gh.singleton<_i187.AirQualityService>(
        () => _i187.AirQualityService(dio: gh<_i361.Dio>()));
    gh.singleton<_i670.WeatherService>(
        () => _i670.WeatherService(dio: gh<_i361.Dio>()));
    gh.singleton<_i438.WeatherCubit>(
        () => _i438.WeatherCubit(weatherService: gh<_i670.WeatherService>()));
    return this;
  }
}

class _$HttpModule extends _i56.HttpModule {}
