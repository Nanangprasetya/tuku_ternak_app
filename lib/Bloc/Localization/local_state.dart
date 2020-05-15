import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class LocalState extends Equatable {
  final Locale locale;

  LocalState({@required this.locale});

  factory LocalState.normal() {
    return LocalState(locale: Locale('id', 'ID'));
  }

  LocalState init({@required Locale locale}) {
    return LocalState(locale: locale ?? this.locale);
  }

  @override
  List<Object> get props => [locale];
}
