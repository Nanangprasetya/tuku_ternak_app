import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider_http_req/Services/Localization/localization.dart';
import 'package:provider_http_req/Util/Colors.dart';
import 'package:provider_http_req/Util/images.dart';
import 'package:provider_http_req/Util/router_constants.dart';
import 'package:provider_http_req/Util/size_config.dart';
import 'package:provider_http_req/Widgets/app_tamplate.dart';
import 'package:provider_http_req/Widgets/buttons.dart';

class LoginHome extends StatelessWidget {
  const LoginHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    void _submiteSignIn() {
      MyNavigator.goToSignIn(context);
    }

    void _submiteSignUp() {
      MyNavigator.goToSignUp(context);
    }

    void _submiteGoogle() {
      //TODO:: Tab login with google
    }

    void _submitePrivacy() {
      //TODO:: Tab Kebijakan dan ketentuan
    }

    return DraftBar(
      appBarBackArrow: false,
      appBarDevider: false,
      text: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(height: 28, child: Image.asset(ImageData.logoPrimer)),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 1.8),
            child: Text(
              MyLocalization.of(context).getTukuternak,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: DataColors.one),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(
                top: SizeConfig.heightMultiplier * 7.5, //64
                left: SizeConfig.widthMultiplier * 5.3, //24
                right: SizeConfig.widthMultiplier * 5.3, //24
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      SizeConfig.heightMultiplier * 2.3), //20
                  child: AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.asset(
                        ImageData.loginHome,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.widthMultiplier * 3.5, //16
                horizontal: SizeConfig.widthMultiplier * 3.5), //16
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AppButton(
                      text: MyLocalization.of(context).getBtnLogin,
                      maxWidth: SizeConfig.widthMultiplier * 45,
                      onTab: _submiteSignIn,
                    ),
                    AppButton(
                      maxWidth: SizeConfig.widthMultiplier * 45,
                      text: MyLocalization.of(context).getBtnRegister,
                      onTab: _submiteSignUp,
                    ),
                  ],
                ),
                AppButton(
                  text: MyLocalization.of(context).getBtnGoogle,
                  style: StyleButton.outlite,
                  imageLeft: ImageData.logoGoogle,
                  onTab: _submiteGoogle,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: MyLocalization.of(context).getTextPrivacy1,
                    style: TextStyle(
                        fontSize: SizeConfig.heightMultiplier * 1.8, //16
                        height: 1.5,
                        color: DataColors.tri),
                    children: [
                      TextSpan(
                        text: MyLocalization.of(context).getTextPrivacy2,
                        style: TextStyle(
                            fontSize: SizeConfig.heightMultiplier * 1.8, //16
                            height: 1.5,
                            color: DataColors.primer),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _submitePrivacy,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
