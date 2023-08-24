import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/repository.dart';
import 'index.dart';

class CheckEmailBloc extends Bloc<CheckEmailEvent,CheckEmailState>{
  Repository authRepository;
  CheckEmailBloc({required this.authRepository}):super(CheckEmailInitial()){
    on<CheckEmailBtnPress>(_mapCheckEmailEventToState);
    on<SendAgainPress>(_mapSendAgainEventToState);
  }

  FutureOr<void> _mapCheckEmailEventToState(CheckEmailBtnPress event, Emitter<CheckEmailState> emit) async {
    emit(CheckEmailLoading());
    try {
      final response = await authRepository.sendOtp(event.request);
      if (response!.success!) {
        emit(CheckEmailSuccess(response: response.message!));
      } else {
        emit(CheckEmailFailure(error: response.message!));
      }
    } catch (error) {
      emit(CheckEmailFailure(error: "$error"));
    }
  }

  FutureOr<void> _mapSendAgainEventToState(SendAgainPress event, Emitter<CheckEmailState> emit) async {
    emit(CheckEmailLoading());
    try {
      final response = await authRepository.sendOtp(event.request);
      if (response!.success!) {
        emit(CheckEmailSuccess(response: response.message!));
      } else {
        emit(CheckEmailFailure(error: response.message!));
      }
    } catch (error) {
      emit(CheckEmailFailure(error: "$error"));
    }
  }
}