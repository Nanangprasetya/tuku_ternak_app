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

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _value = Data.phoneNumber[0].code.trimLeft();

  TextEditingController _controllerPhone = TextEditingController();
  FormBloc _formBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _formBloc = BlocProvider.of<FormBloc>(context);
    _controllerPhone.addListener(_phoneForm);
    super.initState();
  }

  @override
  void dispose() {
    _formBloc.add(ResetForm());
    _controllerPhone.dispose();
    super.dispose();
  }

  void _phoneForm() {
    _formBloc.add(PhoneTextField(phone: "$_value${_controllerPhone.text}"));
  }

  void _navigationVerification() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      MyNavigator.goToLoginVerification(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, MyFormState>(
      builder: (BuildContext context, MyFormState state) => LoginTamplate(
        title: MyLocalization.of(context).getTitleSignIn,
        subtitle: MyLocalization.of(context).getSubTitleSignIn,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFieldTamplate(
                typeTextField: TypeTextField.withDropdown,
                textInputType: TextInputType.phone,
                controller: _controllerPhone,
                label: MyLocalization.of(context).getPhoneLabel,
                fieldHintText: MyLocalization.of(context).getPhoneHint,
                onFieldSubmitted: (i) => _navigationVerification,
                dropdownValue: _value,
                dropdownOnChanged: (i) {
                  setState(() {
                    _value = i;
                  });
                },
                validator: (_) => state.isPhoneValid
                    ? null
                    : MyLocalization.of(context).getPhoneValidationForm,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.8, //24
              ),
              AppButton(
                text: MyLocalization.of(context).getBtnVerification,
                onTab: _navigationVerification,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
