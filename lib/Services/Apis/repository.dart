import 'package:provider_http_req/Models/peopleModel.dart';
import 'package:provider_http_req/Models/restModel.dart';
import 'package:provider_http_req/Services/Apis/apiHttp.dart';

import 'apiDio.dart';

class RepositoryApi implements RestApiService, PeopleApi {
  RestApiService _service = RestApiService();
  PeopleApi _peopleApi = PeopleApi();

  @override
  Future<List<TodoModel>> getAllData() => _service.getAllData();

  @override
  Future<List<TodoModel>> getByIdData(int index) => _service.getByIdData(index);

  @override
  Future<PeopleResponse> getUser() => _peopleApi.getUser();
}
