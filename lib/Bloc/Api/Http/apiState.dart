import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider_http_req/Models/restModel.dart';

abstract class ApiState extends Equatable {
  ApiState();

  List<Object> get props => [];
}

class ApiSuccess extends ApiState {
  final List<TodoModel> list;

  ApiSuccess({@required this.list});

  List<Object> get props => [list];
}

class ApiError extends ApiState {}


class ApiLoading extends ApiState {}