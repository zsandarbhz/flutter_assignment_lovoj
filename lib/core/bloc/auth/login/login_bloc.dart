

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/data/global_data_store.dart';
import '../../../../utils/common_functions.dart';
import '../../../repository/repository.dart';
import 'index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Repository authRepository;

  LoginBloc({
    required this.authRepository,
  }) : super(LoginInit()){
    on<LoginEvent>(_mapGetLoginEventToState);
  }

  void _mapGetLoginEventToState(
      LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginBtnPressed){
      emit(LoginLoading());
      try {
        final response = await authRepository.login(event.request);
        if (response!.success!) {
          if (response.user != null) {
            CommonFunctions.saveUserData(response.user!);
            GlobalDataStore.userData = response.user;
            emit(LoginSuccess(loginResponse: response.user!));

          } else {
            emit(LoginFailure(error: response.message!));
          }
        } else {
          emit(LoginFailure(error: response.message!));
        }
      } catch (error) {
        emit(LoginFailure(error: "$error"));
      }
    }

    if(event is LogoutBtnPressed){
      CommonFunctions.clearUserData();

    }

  }


}
