import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  @observable
  bool _darkTheme = false;

  @action
  void changeDarkTheme() => _darkTheme = !_darkTheme;

  @computed
  bool get getDarkTheme => _darkTheme;
}
