import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_http_req/Models/restModel.dart';
import 'package:provider_http_req/Services/Apis/repository.dart';
import 'bloc.dart';

//mengunakan Lib HTTP

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  RepositoryApi _provider = RepositoryApi();

  @override
  ApiState get initialState => ApiLoading();

  @override
  Stream<ApiState> mapEventToState(ApiEvent event) async* {
    yield ApiLoading();
    List<TodoModel> _list;
    try {
      if (event is TodoAllEvent) {
        _list = await _provider.getAllData();
      } else if (event is TodoByIdEvent) {
        _list = await _provider.getByIdData(event.index);
      }
      if (_list.length == 0) {
        yield ApiLoading();
      } else {
        yield ApiSuccess(list: _list);
      }
    } catch (e) {
      yield ApiError();
    }
  }
}
