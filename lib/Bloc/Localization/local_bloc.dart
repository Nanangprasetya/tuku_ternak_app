import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_http_req/Bloc/Localization/bloc.dart';

class LocalBloc extends Bloc<LocalEvent, LocalState> {
  LocalState get initialState => LocalState.normal();

  @override
  Stream<LocalState> mapEventToState(LocalEvent event) async* {
    if (event is LocalEvent) {
     
        yield state.init(locale: event.locale);
    }
  }
}
