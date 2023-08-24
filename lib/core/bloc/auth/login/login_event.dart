
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();

}

class LoginBtnPressed extends LoginEvent {
  final dynamic request;

  const LoginBtnPressed({
    required this.request,
  });

  @override
  List<Object?> get props => [request];

  @override
  String toString() => 'LoginButtonPressed { Login: ${request} }';
}

class LogoutBtnPressed extends LoginEvent {

  const LogoutBtnPressed();

  @override
  List<Object?> get props => [];

  @override
  String toString() => 'LogoutBtnPressed { Logout }';
}

