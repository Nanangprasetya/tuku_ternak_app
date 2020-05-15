import 'dart:async';

import 'package:connectivity/connectivity.dart';

class NeteworkService {

  StreamController<ConnectivityResult> _streamStatusController =
      StreamController<ConnectivityResult>();
  StreamSink<ConnectivityResult> get _stateSink => _streamStatusController.sink;
  Stream<ConnectivityResult> get stateStream => _streamStatusController.stream;

  NeteworkService() {
    _streamStatusController = StreamController<ConnectivityResult>();
    _initNetworkStatusListen();
  }

  void _initNetworkStatusListen() async {
    _stateSink.add(await Connectivity().checkConnectivity());

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _stateSink.add(result);
    });
  }

  void dispose() {
    _streamStatusController.close();
  }
}
