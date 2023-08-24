import 'package:flutter_assignment_lovoj/utils/common_functions.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/core.dart';
import '../core/network/api/api_services.dart';
import '../core/network/api/dio_client.dart';
import '../core/repository/remote/api_repository.dart';
import '../core/repository/repository.dart';

final sl = GetIt.instance;

Future<void> init(String baseUrl) async {
  CommonFunctions.printLog("base $baseUrl");
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Repository
  sl.registerLazySingleton<Repository>(
          () => ApiRepository(apiService: sl()));

  // Network
  sl.registerLazySingleton(() => ApiService(dio: sl()));
  sl.registerLazySingleton(() => sl<DioClient>().dio);
  sl.registerLazySingleton(() => DioClient(apiBaseUrl: baseUrl));

  sl.registerFactory(() => ValidationBloc());
  sl.registerFactory(() => TimerBloc());
  sl.registerFactory(() => LoginBloc(authRepository: sl()));
  sl.registerFactory(() => CheckEmailBloc(authRepository: sl()));
  sl.registerFactory(() => SignupBloc(authRepository: sl()));
  sl.registerFactory(() => LogoutBloc(authRepository: sl()));

}
