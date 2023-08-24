import 'package:equatable/equatable.dart';

abstract class ValidationEvent extends Equatable {
  const ValidationEvent();
}

class LoginIdCheckValid extends ValidationEvent {
  final String value;

  const LoginIdCheckValid({required this.value});

  @override
  List<Object?> get props => [];
}

class PasswordCheckValid extends ValidationEvent {
  final String value;

  const PasswordCheckValid({required this.value});

  @override
  List<Object?> get props => [];
}

class NewPasswordCheckValid extends ValidationEvent {
  final String value;

  const NewPasswordCheckValid({required this.value});

  @override
  List<Object?> get props => [];
}

class ConfirmPasswordCheckValid extends ValidationEvent {
  final String newPassword, confirmPassword;

  const ConfirmPasswordCheckValid(
      {required this.newPassword, required this.confirmPassword});

  @override
  List<Object?> get props => [];
}

class MobileCheckValid extends ValidationEvent {
  final String value;

  const MobileCheckValid({required this.value});

  @override
  List<Object?> get props => [];
}

class PinCodeCheckValid extends ValidationEvent {
  final String value;

  const PinCodeCheckValid({required this.value});

  @override
  List<Object?> get props => [];
}

class HotelCheckValid extends ValidationEvent {
  final String value;

  const HotelCheckValid({required this.value});

  @override
  List<Object?> get props => [];
}

class CheckMandatory extends ValidationEvent {
  final String value;

  const CheckMandatory({required this.value});

  @override
  List<Object?> get props => [];
}

class EmailCheckValid extends ValidationEvent {
  final String value;

  const EmailCheckValid({required this.value});

  @override
  List<Object?> get props => [];
}

class FirstNameCheckValid extends ValidationEvent {
  final String value;

  const FirstNameCheckValid({required this.value});

  @override
  List<Object?> get props => [];
}

class MiddleNameCheckValid extends ValidationEvent {
  final String value;

  const MiddleNameCheckValid({required this.value});

  @override
  List<Object?> get props => [];
}

class LastNameCheckValid extends ValidationEvent {
  final String value;

  const LastNameCheckValid({required this.value});

  @override
  List<Object?> get props => [];
}

class AddressCheckValid extends ValidationEvent {
  final String value;

  const AddressCheckValid({required this.value});

  @override
  List<Object?> get props => [];
}
