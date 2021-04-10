import 'package:despesas_app/app/pages/body_home/body_home_controller.dart';
import 'package:despesas_app/app/pages/body_plano/body_plano_controller.dart';
import 'package:despesas_app/app/pages/body_plano/body_plano_page.dart';
import 'package:despesas_app/app/pages/home/home_controller.dart';
import 'package:despesas_app/app/pages/home/home_page.dart';
import 'package:despesas_app/app/pages/login/login_controller.dart';
import 'package:despesas_app/app/pages/login/login_page.dart';
import 'package:despesas_app/app/pages/novo_lancamento/novo_lancamento_controller.dart';
import 'package:despesas_app/app/services/auth_service.dart';
import 'package:despesas_app/app/services/home_service.dart';
import 'package:despesas_app/app/services/lancamento_service.dart';
import 'package:despesas_app/app/services/portador_service.dart';
import 'package:despesas_app/app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  //controllers e objetos que serão compartilhados em todo o app
  @override
  List<Bind> get binds => [
    Bind((i) => LoginController()),
    Bind((i) => NovoLancamentoController()),
    Bind((i) => HomeController()),
    Bind((i) => BodyHomeController()),
    Bind((i) => BodyPlanoController()),
    Bind((i) => AuthService(i.get())),
    Bind((i) => PortadorService(i.get())),
    Bind((i) => LancamentoService(i.get())),
    Bind((i) => HomeService(i.get())),
    Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
  ];

  //rotas nomeadas
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (__, args) => LoginPage()),
    ChildRoute('/login', child: (__, args) => LoginPage()),
    ChildRoute('/home', child: (__, args) => HomePage()),
    ChildRoute('/plano', child: (__, args) => BodyPlanoPage())
  ];
}