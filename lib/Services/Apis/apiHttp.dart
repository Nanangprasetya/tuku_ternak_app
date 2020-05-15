import 'dart:convert';

import 'package:provider_http_req/Models/restModel.dart';
import 'package:provider_http_req/Services/Apis/dataRestApi.dart';
import 'package:http/http.dart' as http;

//Meggunakan Lib Http

class RestApiService {
  RestApiService();

  AllApi _api = AllApi();

  Future<List<TodoModel>> getAllData() async {
    List<TodoModel> _list = [];
    await http.get(_api.api).then((i) {
      if (i.statusCode == 200) {
        final response = jsonDecode(i.body);
        for (var i = 0; i < response.length; i++) {
          _list.add(TodoModel.formJson(response[i]));
        }
      } else {
        throw Exception('failed to load');
      }
    });
    return _list;
  }

  Future<List<TodoModel>> getByIdData(int index) async {
    List<TodoModel> _list = [];
    await http.get(ByIdApi(id: index).api).then((i) {
      if (i.statusCode == 200) {
        final response = jsonDecode(i.body);
        for (var i = 0; i < response.length; i++) {
          _list.add(TodoModel.formJson(response[i]));
        }
      } else {
        throw Exception('failed to load');
      }
    });
    return _list;
  }
}
