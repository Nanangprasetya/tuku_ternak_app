import 'package:meta/meta.dart';

abstract class RestApi {
  String api;
}

class AllApi extends RestApi {
  final String _api = 'https://jsonplaceholder.typicode.com/todos';

  AllApi();

  @override
  String get api => _api;
}

class ByIdApi extends RestApi {
  final String _api = 'https://jsonplaceholder.typicode.com/todos/';
  final int id;

  ByIdApi({@required this.id});

  @override
  String get api => '$_api' '$id';
}

class GetApiDio extends RestApi {
  final String _api = 'https://randomuser.me/api/';

  @override
  String get api => _api;
}
