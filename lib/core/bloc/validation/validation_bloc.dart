import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../utils/common_functions.dart';
import 'index.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(ValidationInitial()) {
    on<ValidationEvent>(_mapValidationEventToState);
  }

  FutureOr<void> _mapValidationEventToState(
      ValidationEvent event, Emitter<ValidationState> emit) async {
    if (event is MobileCheckValid) {
      emit(MobileInitial());
      if (event.value.isEmpty) {
        emit(const MobileInvalid(error: "Enter Your Mobile"));
      } else if (event.value.length < 10) {
        emit(const MobileInvalid(error: "Invalid Mobile"));
      } else {
        emit(MobileValid());
      }
    }

    if (event is LoginIdCheckValid) {
      emit(LoginIdInitial());
      if (event.value.isEmpty) {
        emit(const LoginIdInvalid(error: "Enter Your LoginId"));
      } else if (event.value.length < 10) {
        emit(const LoginIdInvalid(error: "Invalid LoginId"));
      } else {
        emit(LoginIdValid());
      }
    }

    if (event is PasswordCheckValid) {
      emit(PasswordInitial());
      if (event.value.isEmpty) {
        emit(const PasswordInvalid(error: "Please Enter your Password"));
      } else if (event.value.length < 6) {
        emit(const PasswordInvalid(
            error: "Password should be at least 6 digits"));
      } else {
        emit(PasswordValid());
      }
    }

    if (event is PinCodeCheckValid) {
      emit(PinCodeInitial());
      if (event.value.isEmpty) {
        emit(const PinCodeInvalid(error: "Please Enter your Pincode"));
      } else if (event.value.length < 6) {
        emit(const PinCodeInvalid(error: "Invalid Pincode"));
      } else {
        emit(PinCodeValid());
      }
    }

    if (event is HotelCheckValid) {
      emit(HotelNameInitial());
      if (event.value.isEmpty) {
        emit(const HotelNameInvalid(error: "Please Enter your Hotel Name"));
      } else {
        emit(HotelNameValid());
      }
    }

    if (event is HotelCheckValid) {
      emit(HotelNameInitial());
      if (event.value.isEmpty) {
        emit(const HotelNameInvalid(error: "Please Enter your Hotel Name"));
      } else {
        emit(HotelNameValid());
      }
    }

    if (event is CheckMandatory) {
      emit(HotelNameInitial());
      if (event.value.isEmpty) {
        emit(const HotelNameInvalid(error: "Please Enter your Hotel Name"));
      } else {
        emit(HotelNameValid());
      }
    }

    if (event is EmailCheckValid) {
      emit(EmailInitial());
      if (event.value.isEmpty) {
        emit(const EmailInvalid(error: "Please Enter your Email"));
      } else if (!CommonFunctions.validateEmail(event.value)) {
        emit(const EmailInvalid(error: "Invalid Email"));
      } else {
        emit(EmailValid());
      }
    }

    if (event is ConfirmPasswordCheckValid) {
      emit(ConfirmPasswordInitial());
      if (event.confirmPassword.isEmpty) {
        emit(const ConfirmPasswordInvalid(
            error: "Please Enter your Confirm Password"));
      } else if (event.confirmPassword != event.newPassword) {
        emit(const ConfirmPasswordInvalid(error: "Password doesn't match"));
      } else {
        emit(ConfirmPasswordValid());
      }
    }

    if (event is NewPasswordCheckValid) {
      emit(NewPasswordInitial());
      if (event.value.isEmpty) {
        emit(const NewPasswordInvalid(error: "Please Enter your New Password"));
      } else if (event.value.length < 6) {
        emit(const NewPasswordInvalid(
            error: "Password should be at least 6 digits"));
      } else {
        emit(NewPasswordValid());
      }
    }

    if (event is FirstNameCheckValid) {
      emit(FirstNameInitial());
      if (event.value.isEmpty) {
        emit(const FirstNameInvalid(error: "Please Enter your First Name"));
      } else {
        emit(FirstNameValid());
      }
    }

    if (event is MiddleNameCheckValid) {
      emit(MiddleNameInitial());
      if (event.value.isEmpty) {
        emit(const MiddleNameInvalid(error: "Please Enter your Middle Name"));
      } else {
        emit(MiddleNameValid());
      }
    }

    if (event is LastNameCheckValid) {
      emit(LastNameInitial());
      if (event.value.isEmpty) {
        emit(const LastNameInvalid(error: "Please Enter your Last Name"));
      } else {
        emit(LastNameValid());
      }
    }

     if (event is AddressCheckValid) {
      emit(AddressInitial());
      if (event.value.isEmpty) {
        emit(const AddressInvalid(error: "Please Enter your Address"));
      } else {
        emit(AddressValid());
      }
    }
  }
}
