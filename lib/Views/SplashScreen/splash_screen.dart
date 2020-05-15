import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_http_req/Util/Colors.dart';
import 'package:provider_http_req/Util/images.dart';
import 'package:provider_http_req/Util/router_constants.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SpashScreenState createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () => MyNavigator.goToSwipper(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: DataColors.primer,
        child: Center(
          child: AspectRatio(
            aspectRatio: 9 / 2,
            child: Image.asset(ImageData.logoWhite),
          ),
        ),
      ),
    );
  }
}
