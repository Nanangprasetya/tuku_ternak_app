import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_http_req/Bloc/Validator/bloc.dart';
import 'package:provider_http_req/Data/Data.dart';
import 'package:provider_http_req/Services/Localization/localization.dart';
import 'package:provider_http_req/Util/router_constants.dart';
import 'package:provider_http_req/Util/size_config.dart';
import 'package:provider_http_req/Widgets/Login/login_tamplate.dart';
import 'package:provider_http_req/Widgets/buttons.dart';
import 'package:provider_http_req/Widgets/textfield_tamplate.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _value = Data.phoneNumber[0].code.trimLeft();

  FormBloc _formBloc;

  FocusNode _focusPhone = FocusNode();
  FocusNode _focusPassword = FocusNode();

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _formBloc = BlocProvider.of<FormBloc>(context);
    _controllerEmail.addListener(_emailForm);
    _controllerPassword.addListener(_passwordForm);
    _controllerPhone.addListener(_phoneForm);
    super.initState();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerPhone.dispose();
    _formBloc.add(ResetForm());
    super.dispose();
  }

  void _emailForm() {
    _formBloc.add(EmailTextField(email: _controllerEmail.text));
  }

  void _phoneForm() {
    _formBloc.add(PhoneTextField(phone: "$_value${_controllerPhone.text}"));
  }

  void _passwordForm() {
    _formBloc.add(PasswordTextField(password: _controllerPassword.text));
  }

  void _navigationverification() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      MyNavigator.goToLoginVerification(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, MyFormState>(
        builder: (BuildContext context, MyFormState state) {
      return LoginTamplate(
        title: MyLocalization.of(context).getTitleSignUp,
        subtitle: MyLocalization.of(context).getSubTitleSignUp,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFieldTamplate(
                textInputType: TextInputType.emailAddress,
                label: MyLocalization.of(context).getEmailLabel,
                fieldHintText: MyLocalization.of(context).getEmailHint,
                controller: _controllerEmail,
                validator: (_) {
                  return state.isEmailValid
                      ? null
                      : MyLocalization.of(context).getEmailValidationForm;
                },
                onFieldSubmitted: (i) =>
                    FocusScope.of(context).requestFocus(_focusPhone),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.8, //24
              ),
              TextFieldTamplate(
                textInputType: TextInputType.phone,
                label: MyLocalization.of(context).getPhoneLabel,
                fieldHintText: MyLocalization.of(context).getPhoneHint,
                typeTextField: TypeTextField.withDropdown,
                dropdownValue: _value,
                focusNode: _focusPhone,
                controller: _controllerPhone,
                validator: (_) {
                  return state.isPhoneValid
                      ? null
                      : MyLocalization.of(context).getPhoneValidationForm;
                },
                onFieldSubmitted: (i) {
                  FocusScope.of(context).requestFocus(_focusPassword);
                },
                dropdownOnChanged: (i) {
                  setState(() {
                    _value = i;
                  });
                },
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.8, //24
              ),
              TextFieldTamplate(
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                label: MyLocalization.of(context).getPasswordLabel,
                fieldHintText: MyLocalization.of(context).getPasswordHint,
                focusNode: _focusPassword,
                controller: _controllerPassword,
                validator: (_) {
                  return state.isPasswordValid
                      ? null
                      : MyLocalization.of(context).getPasswordValidationForm;
                },
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.8, //24
              ),
              AppButton(
                  text: MyLocalization.of(context).getBtnVerification,
                  onTab: _navigationverification),
            ],
          ),
        ),
      );
    }); // );
  }
}
