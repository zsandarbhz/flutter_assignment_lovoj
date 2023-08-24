

import '../../core/models/auth/user_model.dart';

class GlobalDataStore {
  static bool isLogin = false;

  static UserData? userData;


  static clearData(){
    isLogin = false;
  }

}
