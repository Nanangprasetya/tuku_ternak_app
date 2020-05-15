import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider_http_req/Bloc/Theme/bloc.dart';
import 'Bloc/Api/Http/bloc.dart';
import 'Bloc/Api/PeopleDio/bloc.dart';
import 'Bloc/Localization/bloc.dart';
import 'Bloc/Validator/bloc.dart';
import 'Services/Localization/localization.dart';
import 'Services/Router/router_service.dart';

class TestDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(
        'bloc : ${bloc.runtimeType}, error : $error, stacktrace  : $stacktrace');
  }
}

Future<void> main() async {
  BlocSupervisor.delegate = TestDelegate();

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MultiBlocProvider(providers: [
    BlocProvider<ApiBloc>(
      create: (BuildContext context) => ApiBloc(),
    ),
    BlocProvider<PeopleBloc>(
      create: (BuildContext context) => PeopleBloc(),
    ),
    BlocProvider<LocalBloc>(
      create: (BuildContext context) => LocalBloc(),
    ),
    BlocProvider<ThemeBloc>(
      create: (BuildContext context) => ThemeBloc(),
    ),
    BlocProvider<FormBloc>(
      create: (BuildContext context) => FormBloc(),
    ),
  ], child: new MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalBloc, LocalState>(
      builder: (BuildContext context, LocalState localState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          bloc: themeBloc,
          builder: (BuildContext context, ThemeState themeState) {
            return MaterialApp(
              localizationsDelegates: [
                MyLocalizationDelegate(localState.locale),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              title: 'Flutter Demo',
              theme: themeState.themeData,
              supportedLocales: [
                const Locale('en', 'US'),
                const Locale('id', 'ID'),
              ],
              initialRoute: '/',
              onGenerateRoute: (i) => generateRoute(i),
            );
          },
        );
      },
    );
  }
}
