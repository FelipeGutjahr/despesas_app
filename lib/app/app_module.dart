import 'package:despesas_app/app/pages/body_home/body_home_page_controller.dart';
import 'package:despesas_app/app/pages/home/home_controller.dart';
import 'package:despesas_app/app/pages/home/home_page.dart';
import 'package:despesas_app/app/pages/login/login_controller.dart';
import 'package:despesas_app/app/pages/login/login_page.dart';
import 'package:despesas_app/app/pages/novo_lancamento/novo_lancamento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  //controllers e objetos que serão compartilhados em todo o app
  @override
  List<Bind> get binds => [
    Bind((i) => LoginController()),
    Bind((i) => NovoLancamentoController()),
    Bind((i) => HomeController()),
    Bind((i) => BodyHomePageController()),
    Bind((i) => HomePage()),
  ];

  //rotas nomeadas
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (__, args) => LoginPage()),
    ChildRoute('/login', child: (__, args) => LoginPage()),
    ChildRoute('/home', child: (__, args) => HomePage())
  ];
}