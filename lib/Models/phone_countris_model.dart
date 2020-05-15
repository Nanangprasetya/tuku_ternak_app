import 'package:flutter/material.dart';

class PhoneCountris {
  String code;
  String image;

  PhoneCountris({@required this.code, @required this.image});

  PhoneCountris.formJson(Map<String, dynamic> json) {
    code = json['code'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['image'] = this.image;
    return data;
  }
}
