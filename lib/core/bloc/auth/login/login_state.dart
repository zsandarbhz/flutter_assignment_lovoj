
import 'package:equatable/equatable.dart';

import '../../../models/auth/user_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginValid extends LoginState {
  final String? error;
  const LoginValid({required this.error});

  @override
  String toString() => '{error: $error}';
}

class LoginSuccess extends LoginState {
  final UserData loginResponse;
  const LoginSuccess(
      {required this.loginResponse});
  @override
  List<Object?> get props => [loginResponse];

  @override
  String toString() =>
      'LoginSuccess { Response: $loginResponse }';
}

class LoginFailure extends LoginState {
  final String? error;
  const LoginFailure({required this.error});

  @override
  String toString() => '{error: $error}';
}



class LogoutSuccess extends LoginState{}