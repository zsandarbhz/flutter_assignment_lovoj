import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../utils/common_functions.dart';
import '../../models/model.dart';
import 'api_endpoints.dart';
import 'network_exceptions.dart';

class ApiService {
  final Dio? dio;

  ApiService({required this.dio});

  static printLog(Object? msg) {
    if (kDebugMode) {
      print(msg);
    }
  }

  // Dio dioNew = Dio();

  Future<UserModel?> userLogin(var jsonData) async {
    try {
      CommonFunctions.printLog("Request-${jsonData}");
      // String aa = "https://fabricssoftware.com/api/v1/auth/login";
      // String url = "https://api.publicapis.org/entries";
      // final response = await dioNew.post(aa, data: jsonData);
      final response = await dio!.post(ApiEndpoints.loginApiUrl, data: jsonData);
      CommonFunctions.printLog("Response-$response");
      // final response = await dio!.post(ApiEndpoints.loginApiUrl, data: jsonData);
      var data = UserModel.fromJson(response.data);
      return data;
    } on DioError catch (e) {
      CommonFunctions.printLog("Api Error = ${e.message}");
      return UserModel(success: false,
          message: NetworkExceptions.getErrorMessage(
              NetworkExceptions.getDioException(e)!));
    }
  }

  Future<OtpModel?> sendOtp(jsonData) async {
    try {
      CommonFunctions.printLog("Request-$jsonData");
      final response =
      await dio!.post(ApiEndpoints.verifyEmailApiUrl, data: jsonData);
      CommonFunctions.printLog("Response-$response");
      return OtpModel.fromJson(response.data);
    } on DioError catch (e) {
      CommonFunctions.printLog("Api Error = ${e.message}");
      return OtpModel(success: false,
          message: NetworkExceptions.getErrorMessage(
              NetworkExceptions.getDioException(e)!));
    }
  }

  Future<UserModel?> signup(var jsonData) async {
    try {
      CommonFunctions.printLog("Request-$jsonData");
      final response =
      await dio!.post(ApiEndpoints.createStore, data: jsonData);
      CommonFunctions.printLog("Response-$response");
      var data = UserModel.fromJson(response.data);
      return data;
    } on DioError catch (e) {
      CommonFunctions.printLog("Api Error = ${e.message}");
      return UserModel(success: false,
          message: NetworkExceptions.getErrorMessage(
              NetworkExceptions.getDioException(e)!));
    }
  }

}
