import 'package:flutter/material.dart';
import 'package:provider_http_req/Data/Data.dart';
import 'package:provider_http_req/Services/Localization/localization.dart';
import 'package:provider_http_req/Util/Colors.dart';
import 'package:provider_http_req/Util/size_config.dart';

enum TypeTextField { withDropdown, otp, normal }

class TextFieldTamplate<T> extends StatelessWidget {
  final String dropdownValue;
  final TypeTextField typeTextField;
  final ValueChanged<T> dropdownOnChanged;

  final String fieldHintText;
  final TextInputType textInputType;
  final ValueChanged<String> onFieldSubmitted;
  final FocusNode focusNode;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  final String label;
  final bool obscureText;
  final bool autofocus;
  final int maxLength;

  final Widget widgetTimeOtp;

  const TextFieldTamplate({
    Key key,
    this.dropdownValue,
    this.typeTextField = TypeTextField.normal,
    this.dropdownOnChanged,
    this.obscureText = false,
    this.fieldHintText,
    this.onFieldSubmitted,
    this.controller,
    this.validator,
    this.maxLength,
    this.label,
    this.widgetTimeOtp,
    this.autofocus = false,
    this.focusNode,
    @required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsetsDirectional.only(
              bottom: SizeConfig.heightMultiplier * 1.4, //12
            ),
            child: Visibility(
              visible: label != null,
              child: Text(
                label ?? "",
                style: TextStyle(
                  fontSize: SizeConfig.heightMultiplier * 1.8,
                  fontWeight: FontWeight.w500,
                  color: DataColors.tri,
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DropdownButtonHideUnderline(
                child: typeTextField == TypeTextField.withDropdown
                    ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.heightMultiplier * 1.8,
                          vertical: SizeConfig.widthMultiplier * 1.0,
                        ),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Color(0xFFEEEEEE),
                          ),
                          child: DropdownButton(
                            elevation: 1,
                            onChanged: (i) => dropdownOnChanged(i),
                            value: dropdownValue ?? null,
                            items: Data.phoneNumber.map((i) {
                              return DropdownMenuItem(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Image.asset(
                                      i.image,
                                      width: 32.0,
                                    ),
                                    SizedBox(width: 4),
                                    Text(i.code),
                                  ],
                                ),
                                value: i.code,
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    : Container(),
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: textInputType ?? null,
                  controller: controller ?? null,
                  autofocus: autofocus,
                  obscureText: obscureText,
                  maxLength: maxLength,
                  onFieldSubmitted: (i) => onFieldSubmitted(i),
                  focusNode: focusNode ?? null,
                  textAlign: typeTextField == TypeTextField.otp
                      ? TextAlign.center
                      : TextAlign.left,
                  validator: (i) {
                    if (i.isEmpty) {
                      return MyLocalization.of(context).getEmptyValidationForm;
                    } else {
                      return validator(i);
                    }
                  },
                  style: typeTextField == TypeTextField.otp
                      ? TextStyle(letterSpacing: 10)
                      : null,
                  decoration: InputDecoration(
                    errorMaxLines: 1,
                    hintText: fieldHintText ?? null,
                    filled: true,
                    errorText: null,
                    counterText: '',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: DataColors.line)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: DataColors.line)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: DataColors.danger)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: DataColors.line)),
                    fillColor: Color(0xFFEEEEEE),
                  ),
                ),
              ),
            ],
          ),
          Offstage(
            offstage: typeTextField != TypeTextField.otp,
            child: widgetTimeOtp,
          ),
        ],
      ),
    );
  }
}
