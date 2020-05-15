
abstract class ThemeEvent {}

class ThemeDark extends ThemeEvent {
  @override
  String toString() => 'ThemeDark';
}

class ThemeLight extends ThemeEvent {
  @override
  String toString() => 'ThemeLight';
}

class PrefData extends ThemeEvent {}
