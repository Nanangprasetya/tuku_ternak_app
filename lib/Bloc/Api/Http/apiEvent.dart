import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ApiEvent extends Equatable {
  ApiEvent();

  List<Object> get props => [];
}

class TodoAllEvent extends ApiEvent {}

class TodoByIdEvent extends ApiEvent {
  final int index;

  TodoByIdEvent({@required this.index});

  List<Object> get props => [index];
}
