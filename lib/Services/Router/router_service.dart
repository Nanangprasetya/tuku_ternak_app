import 'package:flutter/material.dart';
import 'package:provider_http_req/Views/Debug/test_debug.dart';
import 'package:provider_http_req/Views/Logins/login_home.dart';
import 'package:provider_http_req/Views/Logins/login_verification.dart';
import 'package:provider_http_req/Views/Logins/sign_in.dart';
import 'package:provider_http_req/Views/Logins/sign_up.dart';
import 'package:provider_http_req/Views/SplashScreen/splash_screen.dart';
import 'package:provider_http_req/Views/Swippers/swiper.dart';
import 'package:provider_http_req/Views/homeUi.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => SplashScreen());
      break;
    case '/swipper':
      return MaterialPageRoute(builder: (context) => Swipper());
      break;
    case '/signIn':
      return MaterialPageRoute(builder: (context) => SignIn());
      break;
    case '/signUp':
      return MaterialPageRoute(builder: (context) => SignUp());
      break;
    case '/loginVerification':
      return MaterialPageRoute(builder: (context) => LoginVerification());
      break;
    case '/loginHome':
      return MaterialPageRoute(builder: (context) => LoginHome());
      break;
    case '/home':
      return MaterialPageRoute(builder: (context) => MyHomePage());
      break;
    default:
      return MaterialPageRoute(
          builder: (context) => TestDebug(name: settings.name));
  }
}
