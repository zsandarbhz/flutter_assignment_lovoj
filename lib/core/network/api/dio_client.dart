import 'dart:io';

import 'package:dio/dio.dart';

import '../../../app/data/global_data_store.dart';

class DioClient {
  final String apiBaseUrl;

  DioClient({required this.apiBaseUrl});

  Dio get dio => _getDio();


  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 50000),
    );
    Dio dio = Dio(options);
    // dio.options.headers['OSType'] = _getPlatform();
    dio.interceptors.addAll(<Interceptor>[
      _loggingInterceptor(),
      // LogInterceptor(
      //     responseBody: true, requestBody: true, logPrint: Logger().d),
    ]);

    return dio;
  }

  _getPlatform() {
    return Platform.isAndroid ? 'android' : (Platform.isIOS ? "iOS" : "other");
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    });
  }
}
