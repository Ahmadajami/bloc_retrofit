
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quotes_shop/locator.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quotes_shop/services/rest_client/rest_client.dart';

Dio buildDio(){
  final dio=Dio();
  dio.options.headers['Content-Type'] = 'application/json';
  //dio.interceptors.add();
dio.interceptors.addAll([
  PrettyDioLogger(
      requestHeader: false,
      requestBody: false,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
      /*filter: (options, args) {
        // don't print requests with uris containing '/posts'
        if (options.path.contains('/posts')) {
          return false;
        }
        // don't print responses with unit8 list data
        return !args.isResponse || !args.hasUint8ListData;
      },*/
  ),
]);
  return dio;
}
void initNetwork(){
  final dio=buildDio();
  locator.registerLazySingleton<RestClient>(()=> RestClient(dio));
}