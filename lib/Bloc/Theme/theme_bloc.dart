import 'package:bloc/bloc.dart';
import 'package:provider_http_req/Bloc/Theme/bloc.dart';
import 'package:provider_http_req/Services/Theme/sharedTheme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  void onLightTheme() => add(ThemeLight());
  void onDarkTheme() => add(ThemeDark());

  @override
  ThemeState get initialState => ThemeState.light();

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is PrefData) {
      final bool _data = await SharedTheme().getTheme();
      if (_data) {
        yield ThemeState.dark();
      } else {
        yield ThemeState.light();
      }
    } else if (event is ThemeDark) {
      yield ThemeState.dark();
      SharedTheme().setTheme(true);
    } else if (event is ThemeLight) {
      yield ThemeState.light();
      SharedTheme().setTheme(false);
    }
  }
}

final ThemeBloc themeBloc = ThemeBloc()..add(PrefData()); // menjalankan PrefData Laangsung
