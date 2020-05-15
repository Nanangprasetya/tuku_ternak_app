import 'package:provider_http_req/Services/Validator/reg_exp.dart';

class TextFieldValidator extends RegService {
  bool isEmailValid(String email) {
    return emailRegExp.hasMatch(email);
  }

  bool isPasswordValid(String pass) {
    return passwordRegExp.hasMatch(pass);
  }

  bool isPhoneValid(String phone) {
    return phoneRegExp.hasMatch(phone);
  }

  bool isOtpValid(String otp) {
    return otpRegExp.hasMatch(otp);
  }
}
