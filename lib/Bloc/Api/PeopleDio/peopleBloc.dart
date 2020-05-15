import 'package:bloc/bloc.dart';
import 'package:provider_http_req/Models/peopleModel.dart';
import 'package:provider_http_req/Services/Apis/repository.dart';

import 'bloc.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  RepositoryApi _api = RepositoryApi();
  @override
  PeopleState get initialState => PeopleLoading();

  @override
  Stream<PeopleState> mapEventToState(PeopleEvent event) async* {
    yield PeopleLoading();
    PeopleResponse _list;
    if (event is FetchPeople) {
      _list = await _api.getUser();
      if (_list.error.isNotEmpty) {
        yield PeopleError(_list.error);
      } else {
        yield PeopleSuccess(_list.results);
      }
    }
  }
}
