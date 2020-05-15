import 'package:flutter/material.dart';
import 'package:provider_http_req/Util/Colors.dart';
import 'package:provider_http_req/Util/images.dart';
import 'package:provider_http_req/Util/size_config.dart';
import 'package:provider_http_req/Widgets/app_tamplate.dart';

class LoginTamplate extends StatelessWidget {
  final Widget child;
  final String title;
  final String subtitle;
  final String richSubtitle;

  const LoginTamplate(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.child,
      this.richSubtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraftBar(
        appBarBackArrow: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.widthMultiplier * 3.5, //16
                horizontal: SizeConfig.widthMultiplier * 3.5), //16
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsetsDirectional.only(
                    bottom: SizeConfig.heightMultiplier * 10, //86
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipOval(
                        child: Container(
                          height: SizeConfig.heightMultiplier * 8,
                          width: SizeConfig.heightMultiplier * 8,
                          color: DataColors.primer,
                          child: Center(
                              child: Image.asset(ImageData.logoWhite,
                                  height: 28, width: 28)),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.8, //16
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: SizeConfig.heightMultiplier * 2.8, //24
                            color: DataColors.one,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.4, //12
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: subtitle,
                          style: TextStyle(
                              fontSize: SizeConfig.heightMultiplier * 1.8, //16
                              height: 1.5,
                              color: DataColors.tri),
                          children: [
                            TextSpan(
                              text: richSubtitle??"",
                              style: TextStyle(
                                  fontSize:
                                      SizeConfig.heightMultiplier * 1.8, //16
                                  height: 1.5,
                                  color: DataColors.primer),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                child
              ],
            ),
          ),
        ));
  }
}
