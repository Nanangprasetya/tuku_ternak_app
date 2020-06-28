import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_http_req/Bloc/Validator/bloc.dart';
import 'package:provider_http_req/Services/Localization/localization.dart';
import 'package:provider_http_req/Util/Colors.dart';
import 'package:provider_http_req/Util/router_constants.dart';
import 'package:provider_http_req/Util/size_config.dart';
import 'package:provider_http_req/Widgets/Login/login_tamplate.dart';
import 'package:provider_http_req/Widgets/buttons.dart';
import 'package:provider_http_req/Widgets/textfield_tamplate.dart';

class LoginVerification extends StatefulWidget {
  const LoginVerification({
    Key key,
  }) : super(key: key);

  @override
  _SignInVerificationState createState() => _SignInVerificationState();
}

class _SignInVerificationState extends State<LoginVerification>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  int time = 30;
  int addTime = 0;
  bool timeExp = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controllerOtp = TextEditingController();
  FormBloc _formBloc;

  @override
  void initState() {
    super.initState();
    _animationController = _timerOtp();
    _timerReset();
    _formBloc = BlocProvider.of<FormBloc>(context);
    _controllerOtp.addListener(_otpForm);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controllerOtp.dispose();
    super.dispose();
  }

  AnimationController _timerOtp() {
    return AnimationController(vsync: this, duration: Duration(seconds: time))
      ..addStatusListener(
        (i) {
          if (i == AnimationStatus.dismissed) {
            timeExp = !timeExp;
          }
        },
      );
  }

  void _timerReset() {
    _animationController.reverse(
        from: _animationController.value == 0.0
            ? 1.0
            : _animationController.value);
  }

  void _sendOtpCode() {
    if (timeExp) {
      setState(() {
        addTime += 30;
      });
    }
    setState(() {
      timeExp = false;
    });
    _timerReset();
  }

  String _timerString() {
    Duration duration =
        (_animationController.duration + Duration(seconds: addTime)) *
            _animationController.value;
    int hours = (duration.inSeconds / 3600).truncate();
    int seconds = (duration.inSeconds % 3600).truncate();
    int minutes = (duration.inSeconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(0, '0');

    if (hours == 0) {
      return "$secondsStr";
    }
    return "$hoursStr:$minutesStr:$secondsStr";
  }

  void _otpForm() {
    _formBloc.add(OtpTextField(otp: _controllerOtp.text));
  }

  void _submiteNavigation() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      MyNavigator.goToHome(context);
      // Navigator.pushNamed(context, '/routeName');
      //TODO::back end logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, MyFormState>(
      builder: (BuildContext context, MyFormState state) => LoginTamplate(
        title: MyLocalization.of(context).getTitleLoginVerification,
        subtitle: MyLocalization.of(context).getSubTitleLoginVerification,
        richSubtitle: "${state.phone}",
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFieldTamplate(
                textInputType: TextInputType.number,
                typeTextField: TypeTextField.otp,
                fieldHintText: MyLocalization.of(context).getOtpHint,
                maxLength: 5,
                autofocus: true,
                controller: _controllerOtp,
                validator: (_) => state.isOtpValid
                    ? null
                    : MyLocalization.of(context).getOtpValidationForm,
                onFieldSubmitted: (_) => _submiteNavigation,
                widgetTimeOtp: AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget child) => Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsetsDirectional.only(
                      top: SizeConfig.heightMultiplier * 1.0,
                    ),
                    child: Text(
                      "${MyLocalization.of(context).getOtpTimerOut}(${_timerString()})",
                      style: TextStyle(
                        fontSize: SizeConfig.heightMultiplier * 1.6,
                        fontWeight: FontWeight.w500,
                        color: DataColors.five,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.8, //24
              ),
              AppButton(
                text: MyLocalization.of(context).getBtnLogin,
                onTab: _submiteNavigation,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.8, //24
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: MyLocalization.of(context).getTextResend1,
                  style: TextStyle(
                      fontSize: SizeConfig.heightMultiplier * 1.8, //16
                      height: 1.5,
                      color: DataColors.tri),
                  children: [
                    TextSpan(
                      text: MyLocalization.of(context).getTextResend2,
                      style: TextStyle(
                          fontSize: SizeConfig.heightMultiplier * 1.8, //16
                          height: 1.5,
                          color: DataColors.primer),
                      recognizer: TapGestureRecognizer()..onTap = _sendOtpCode,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
