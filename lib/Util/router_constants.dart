import 'package:flutter/cupertino.dart';

class MyNavigator {
  MyNavigator._();

  static void goToSwipper(BuildContext context) =>
      Navigator.pushNamed(context, '/swipper');
  static void goToLoginHome(BuildContext context) =>
      Navigator.pushNamed(context, '/loginHome');
  static void goToSignIn(BuildContext context) =>
      Navigator.pushNamed(context, '/signIn');
  static void goToSignUp(BuildContext context) =>
      Navigator.pushNamed(context, '/signUp');
  static void goToLoginVerification(BuildContext context) =>
      Navigator.pushNamed(context, '/loginVerification');
  static void goToHome(BuildContext context) =>
      Navigator.pushNamed(context, '/home');
}
