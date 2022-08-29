import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

// SharedPreferences Keys
  static const String keyLastPage = "lastPage";
  static const String keyMarkedPage = "markedPage";
  static const String keyLastTab = "lastTab";
  static const String keyIsDarkMode = "isDarkMode";
  static const String keyIsFullscreen = "isFullscreen";

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  int get lastPage => _sharedPrefs!.getInt(keyLastPage) ?? 0;
  int get lastTab => _sharedPrefs!.getInt(keyLastTab) ?? 0;
  int get markedPage => _sharedPrefs!.getInt(keyMarkedPage) ?? 0;
  bool get isDarkMode => _sharedPrefs!.getBool(keyIsDarkMode) ?? false;
  bool get isFullscreen => _sharedPrefs!.getBool(keyIsFullscreen) ?? false;

  set lastPage(int value) {
    _sharedPrefs!.setInt(keyLastPage, value);
  }

  set markedPage(int value) {
    _sharedPrefs!.setInt(keyMarkedPage, value);
  }

  set lastTab(int value) {
    _sharedPrefs!.setInt(keyLastTab, value);
  }

  set isDarkMode(bool value) {
    _sharedPrefs!.setBool(keyIsDarkMode, value);
  }

  set isFullscreen(bool value) {
    _sharedPrefs!.setBool(keyIsFullscreen, value);
  }

  static void clearData() {
    _sharedPrefs!.clear();
  }
}

final sharedPrefs = SharedPrefs();
