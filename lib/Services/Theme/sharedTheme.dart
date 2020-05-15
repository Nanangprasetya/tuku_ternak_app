import 'package:shared_preferences/shared_preferences.dart';

class SharedTheme {
  SharedTheme();

  void setTheme(bool value) async {
    SharedPreferences.getInstance().then((i) {
      return i.setBool('theme', value);
    });
    print('Theme => $value');
  }

  Future<bool> getTheme() async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    return _shared.getBool('theme') ?? false;
  }
}
