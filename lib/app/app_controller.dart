import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  _AppController() {
    _getSettings();
  }

  @observable
  String _token = '';

  @observable
  bool _darkTheme = false;

  @action
  void _setToken(token) => _token = token;

  @action
  void changeDarkTheme() => _darkTheme = !_darkTheme;

  @computed
  bool get getTokenIsValid {
    if (_token == '' || _token.isEmpty)
      return false;
    else
      return true;
  }

  @computed
  bool get getDarkTheme => _darkTheme;

  _getSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('dark_theme') != null && prefs.getBool('dark_theme'))
      changeDarkTheme();
    _setToken(prefs.getString('token_acesss'));
  }
}
