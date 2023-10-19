import 'package:dio/dio.dart';
import 'package:my_app/utils/back4app.interceptor.dart';

class Task2CustomDio {
  final _customDio = Dio();

  Dio get customDio => _customDio;

  Task2CustomDio() {
    _customDio.options.baseUrl = 'https://parseapi.back4app.com/classes';
    _customDio.interceptors.add(Back4AppInterceptor());
  }
}
