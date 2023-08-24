import 'package:equatable/equatable.dart';

abstract class ValidationState extends Equatable {
  const ValidationState();

  @override
  List<Object?> get props => [];
}

class ValidationInitial extends ValidationState {}

class ValidationValid extends ValidationState {}

class ValidationInvalid extends ValidationState {}

//For Mobile
class MobileInitial extends ValidationState {}

class MobileValid extends ValidationState {}

class MobileInvalid extends ValidationState {
  final String error;
  const MobileInvalid({required this.error});

  @override
  List<Object?> get props => [error];
}

//For Login Id
class LoginIdInitial extends ValidationState {}

class LoginIdValid extends ValidationState {}

class LoginIdInvalid extends ValidationState {
  final String error;
  const LoginIdInvalid({required this.error});

  @override
  List<Object?> get props => [error];
}

//For Password
class PasswordInitial extends ValidationState {}

class PasswordValid extends ValidationState {}

class PasswordInvalid extends ValidationState {
  final String error;
  const PasswordInvalid({required this.error});

  @override
  List<Object?> get props => [error];
}

//For PinCode
class PinCodeInitial extends ValidationState {}

class PinCodeValid extends ValidationState {}

class PinCodeInvalid extends ValidationState {
  final String error;
  const PinCodeInvalid({required this.error});

  @override
  List<Object?> get props => [error];
}

//For HotelName
class HotelNameInitial extends ValidationState {}

class HotelNameValid extends ValidationState {}

class HotelNameInvalid extends ValidationState {
  final String error;
  const HotelNameInvalid({required this.error});

  @override
  List<Object?> get props => [error];
}

//For Email
class EmailInitial extends ValidationState {}

class EmailValid extends ValidationState {}

class EmailInvalid extends ValidationState {
  final String error;
  const EmailInvalid({required this.error});

  @override
  List<Object?> get props => [error];
}

//For NewPassword
class NewPasswordInitial extends ValidationState {}

class NewPasswordValid extends ValidationState {}

class NewPasswordInvalid extends ValidationState {
  final String error;
  const NewPasswordInvalid({required this.error});

  @override
  List<Object?> get props => [error];
}

//For ConfirmPassword
class ConfirmPasswordInitial extends ValidationState {}

class ConfirmPasswordValid extends ValidationState {}

class ConfirmPasswordInvalid extends ValidationState {
  final String error;
  const ConfirmPasswordInvalid({required this.error});

  @override
  List<Object?> get props => [error];
}

// For FirstName
class FirstNameInitial extends ValidationState {}

class FirstNameValid extends ValidationState {}

class FirstNameInvalid extends ValidationState {
  final String error;
  const FirstNameInvalid({required this.error});
  @override
  List<Object?> get props => [error];
}

// For MiddleName
class MiddleNameInitial extends ValidationState {}

class MiddleNameValid extends ValidationState {}

class MiddleNameInvalid extends ValidationState {
  final String error;
  const MiddleNameInvalid({required this.error});
  @override
  List<Object?> get props => [error];
}

// For LastName
class LastNameInitial extends ValidationState {}

class LastNameValid extends ValidationState {}

class LastNameInvalid extends ValidationState {
  final String error;
  const LastNameInvalid({required this.error});
  @override
  List<Object?> get props => [error];
}

// For Address
class AddressInitial extends ValidationState {}

class AddressValid extends ValidationState {}

class AddressInvalid extends ValidationState {
  final String error;
  const AddressInvalid({required this.error});
  @override
  List<Object?> get props => [error];
}
