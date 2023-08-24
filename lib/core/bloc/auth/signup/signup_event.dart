
import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable{
  const SignupEvent();

}

class SignupBtnPressed extends SignupEvent {
  final dynamic request;

  const SignupBtnPressed({
    required this.request,
  });

  @override
  List<Object?> get props => [request];

  @override
  String toString() => 'SignupButtonPressed { Signup: $request }';
}

class LogoutBtnPressed extends SignupEvent {

  const LogoutBtnPressed();

  @override
  List<Object?> get props => [];

  @override
  String toString() => 'SignupButtonPressed { Signup }';
}

