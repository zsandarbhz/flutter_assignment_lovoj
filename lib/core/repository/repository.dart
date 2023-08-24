import '../models/model.dart';


abstract class Repository {

  Future<UserModel?> login(var jsonData);

  Future<OtpModel?> sendOtp(var jsonData);

  Future<UserModel?> signup(var jsonData);

}
