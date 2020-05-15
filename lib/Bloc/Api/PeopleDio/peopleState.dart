import 'package:equatable/equatable.dart';
import 'package:provider_http_req/Models/peopleModel.dart';

abstract class PeopleState extends Equatable {
  @override
  List<Object> get props => [];
}

class PeopleSuccess extends PeopleState {
  final List<People> results;

  PeopleSuccess(this.results);
  @override
  List<Object> get props => [results];
}

class PeopleLoading extends PeopleState {}

class PeopleError extends PeopleState {
  final String error;

  PeopleError(this.error);
  @override
  List<Object> get props => [error];
}
