

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/common_functions.dart';
import '../../../repository/repository.dart';
import 'index.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final Repository authRepository;

  LogoutBloc({
    required this.authRepository,
  }) : super(LogoutInit()){
    on<LogoutEvent>(_mapGetLoginEventToState);
  }

  void _mapGetLoginEventToState(
      LogoutEvent event, Emitter<LogoutState> emit) async {
    if (event is LogoutBtnPressed){
          emit(LogoutLoading());
    }

    if(event is LogoutBtnPressed){
      CommonFunctions.clearUserData();
    }

  }


}
