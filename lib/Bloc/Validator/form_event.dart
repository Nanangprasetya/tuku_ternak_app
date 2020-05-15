import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class EmailTextField extends FormEvent {
  final String email;

  const EmailTextField({this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'EmailValue {email = $email}';
  }
}

class PhoneTextField extends FormEvent {
  final String phone;

  const PhoneTextField({this.phone});

  @override
  List<Object> get props => [phone];

  @override
  String toString() {
    return 'PhoneValue {phone = $phone}';
  }
}

class PasswordTextField extends FormEvent {
  final String password;

  const PasswordTextField({this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() {
    return 'PasswordValue {password = $password}';
  }
}

class OtpTextField extends FormEvent {
  final String otp;

  const OtpTextField({this.otp});

  @override
  List<Object> get props => [otp];

  @override
  String toString() {
    return 'OtpValue {otp = $otp}';
  }
}


class ResetForm extends FormEvent {}
