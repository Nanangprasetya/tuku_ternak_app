import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LocalEvent extends Equatable {
  final Locale locale;
  const LocalEvent({@required this.locale});

  @override
  List<Object> get props => [locale];
}
