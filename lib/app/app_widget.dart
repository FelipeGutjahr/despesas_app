import 'package:despesas_app/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<AppController>();

    return Observer(builder: (_) {
      return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light, primaryColor: Colors.blueAccent),
        darkTheme: ThemeData(
            brightness: Brightness.dark, accentColor: Colors.blueAccent),
        themeMode: _controller.getDarkTheme ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        title: 'Despesas App',
        initialRoute: '/',
      ).modular();
    });
  }
}
