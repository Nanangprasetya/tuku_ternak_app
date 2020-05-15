import 'package:bloc/bloc.dart';
import 'package:provider_http_req/Services/Validator/textfield_validator.dart';

import 'bloc.dart';

class FormBloc extends Bloc<FormEvent, MyFormState> {
  TextFieldValidator _fieldValidator = TextFieldValidator();
  @override
  MyFormState get initialState => MyFormState.empty();

  @override
  Stream<MyFormState> mapEventToState(FormEvent event) async* {

    if (event is EmailTextField) {
      yield state.copyWith(
        email: event.email,
        isEmailValid: _fieldValidator.isEmailValid(event.email),
      );
    }
    if (event is PasswordTextField) {
      yield state.copyWith(
          password: event.password,
          isPasswordValid: _fieldValidator.isPasswordValid(event.password));
    }
    if (event is PhoneTextField) {
      yield state.copyWith(
          phone: event.phone,
          isPhoneValid: _fieldValidator.isPhoneValid(event.phone));
    }
    if (event is OtpTextField) {
      yield state.copyWith(
          otp: event.otp,
          isOtpValid: _fieldValidator.isOtpValid(event.otp));
    }
    if (event is ResetForm) {
      yield MyFormState.empty();
    }
  }

  // String _emailValidation(String event) {
  //   bool data = _fieldValidator.isEmailValid(event);
  //   if (!data) {
  //     return "Email Salah";
  //   } else {
  //     return null;
  //   }
  // }
}
