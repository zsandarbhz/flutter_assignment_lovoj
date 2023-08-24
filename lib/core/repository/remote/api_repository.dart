
import '../../models/model.dart';
import '../../network/api/api_services.dart';
import '../repository.dart';

class ApiRepository implements Repository {
  final ApiService? apiService;
  ApiRepository({required this.apiService});

  @override
  Future<UserModel?> login(var jsonData) {
    return apiService!.userLogin(jsonData);
  }

  @override
  Future<OtpModel?> sendOtp(jsonData) {
    return apiService!.sendOtp(jsonData);
  }

  @override
  Future<UserModel?> signup(var jsonData) {
    return apiService!.signup(jsonData);
  }


}
