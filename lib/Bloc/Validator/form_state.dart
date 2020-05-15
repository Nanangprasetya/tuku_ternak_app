import 'package:equatable/equatable.dart';

class MyFormState extends Equatable {
  final String email;
  final String password;
  final String phone;
  final String otp;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isPhoneValid;
  final bool isOtpValid;
  final bool formSubmittedSuccessfully;


  const MyFormState({
    this.email,
    this.password,
    this.phone,
    this.otp,
    this.isEmailValid,
    this.isPasswordValid,
    this.isPhoneValid,
    this.isOtpValid,
    this.formSubmittedSuccessfully,
  });

  factory MyFormState.empty() {
    return MyFormState(
        email: '',
        password: '',
        phone: '',
        otp: '',
        isEmailValid: false,
        isPasswordValid: false,
        isPhoneValid: false,
        formSubmittedSuccessfully: false,
        isOtpValid: false);
  }

  MyFormState copyWith(
      {String email,
      String password,
      String phone,
      String otp,
      String emailMassageValid,
      String passwordMassageValid,
      String phoneMassageValid,
      String otpMassageValid,
      bool isEmailValid,
      bool isPasswordValid,
      bool isPhoneValid,
      bool isOtpValid,
      bool formSubmittedSuccessfully}) {
    return MyFormState(
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        otp: otp ?? this.otp,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isPhoneValid: isPhoneValid ?? this.isPhoneValid,
        isOtpValid: isOtpValid ?? this.isOtpValid,
        formSubmittedSuccessfully:
            formSubmittedSuccessfully ?? this.formSubmittedSuccessfully);
  }

  @override
  List<Object> get props => [
        email,
        password,
        phone,
        otp,
        isEmailValid,
        isPasswordValid,
        isPhoneValid,
        isOtpValid,
        formSubmittedSuccessfully,
      ];
  @override
  String toString() {
    return 'MyFormState {email : $email,password : $password, phone : $phone, isEmailValid : $isEmailValid, isPasswordValid : $isPasswordValid, isPhoneValid : $isPhoneValid, formSubmittedSuccessfully : $formSubmittedSuccessfully }';
  }
}
