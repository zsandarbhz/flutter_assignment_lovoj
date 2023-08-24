
import 'package:equatable/equatable.dart';

import '../../../models/auth/user_model.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

class SignupInit extends SignupState {}

class SignupLoading extends SignupState {}

class SignupValid extends SignupState {
  final String? error;
  const SignupValid({required this.error});

  @override
  String toString() => '{error: $error}';
}

class SignupSuccess extends SignupState {
  final UserData loginResponse;
  const SignupSuccess(
      {required this.loginResponse});
  @override
  List<Object?> get props => [loginResponse];

  @override
  String toString() =>
      'LoginSuccess { Response: $loginResponse }';
}

class SignupFailure extends SignupState {
  final String? error;
  const SignupFailure({required this.error});

  @override
  String toString() => '{error: $error}';
}



class LogoutSuccess extends SignupState{}