import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpModule {
  @singleton
  Dio dio() => Dio()..interceptors.add(LogInterceptor());
}
