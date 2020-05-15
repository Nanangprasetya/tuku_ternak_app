import 'package:dio/dio.dart';
import 'package:provider_http_req/Models/peopleModel.dart';
import 'package:provider_http_req/Services/Apis/dataRestApi.dart';

class PeopleApi {
  final Dio _dio = Dio();

  Future<PeopleResponse> getUser() async {
    try {
      Response response = await _dio.get(GetApiDio().api);
      return PeopleResponse.formJson(response.data);
    } catch (e) {
      print("Exception  => $e");
      return PeopleResponse.errorResponse(e.toString());
    }
  }
}
