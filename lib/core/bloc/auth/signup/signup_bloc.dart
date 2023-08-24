

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/data/global_data_store.dart';
import '../../../../utils/common_functions.dart';
import '../../../repository/repository.dart';
import 'index.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final Repository authRepository;

  SignupBloc({
    required this.authRepository,
  }) : super(SignupInit()){
    on<SignupEvent>(_mapGetSignupEventToState);
  }

  void _mapGetSignupEventToState(
      SignupEvent event, Emitter<SignupState> emit) async {
    if (event is SignupBtnPressed){
      emit(SignupLoading());
      try {
        final response = await authRepository.signup(event.request);
        if (response!.success!) {
          if (response.user != null) {
            CommonFunctions.saveUserData(response.user!);
            GlobalDataStore.userData = response.user;
            emit(SignupSuccess(loginResponse: response.user!));

          } else {
            emit(SignupFailure(error: response.message!));
          }
        } else {
          emit(SignupFailure(error: response.message!));
        }
      } catch (error) {
        emit(SignupFailure(error: "$error"));
      }
    }

    if(event is LogoutBtnPressed){
      CommonFunctions.clearUserData();

    }

  }


}
