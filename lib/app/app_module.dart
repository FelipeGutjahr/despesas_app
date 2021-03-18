import 'package:despesas_app/app/pages/home/home_page.dart';
import 'package:despesas_app/app/pages/login/login_controller.dart';
import 'package:despesas_app/app/pages/login/login_page.dart';
import 'package:despesas_app/app/pages/nova_despesa/nova_despesa_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  //controllers e objetos que serão compartilhados em todo o app
  @override
  List<Bind> get binds => [
    Bind((i) => LoginController())
  ];

  //rotas nomeadas
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (__, args) => LoginPage()),
    ChildRoute('/login', child: (__, args) => LoginPage()),
    ChildRoute('/home', child: (__, args) => HomePage()),
    ChildRoute('/nova_despesa', child: (__, args) => NovaDespesa())
  ];
}