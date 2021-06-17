import 'package:despesas_app/app/app_controller.dart';
import 'package:despesas_app/app/pages/duplicata_receber/duplicata_controller.dart';
import 'package:despesas_app/app/pages/duplicata_receber/duplicata_page.dart';
import 'package:despesas_app/app/pages/home/home_controller.dart';
import 'package:despesas_app/app/pages/home/home_page.dart';
import 'package:despesas_app/app/pages/login/login_controller.dart';
import 'package:despesas_app/app/pages/login/login_page.dart';
import 'package:despesas_app/app/pages/nova_despesa/nova_despesa_controller.dart';
import 'package:despesas_app/app/pages/nova_receita/nova_receita_controller.dart';
import 'package:despesas_app/app/pages/novo_plano/novo_plano_controller.dart';
import 'package:despesas_app/app/pages/novo_portador/novo_portador_controller.dart';
import 'package:despesas_app/app/pages/plano/plano_controller.dart';
import 'package:despesas_app/app/pages/plano/plano_page.dart';
import 'package:despesas_app/app/pages/settings/settings_controller.dart';
import 'package:despesas_app/app/pages/settings/settings_page.dart';
import 'package:despesas_app/app/services/auth_service.dart';
import 'package:despesas_app/app/services/duplicata_service.dart';
import 'package:despesas_app/app/services/home_service.dart';
import 'package:despesas_app/app/services/lancamento_service.dart';
import 'package:despesas_app/app/services/plano_service.dart';
import 'package:despesas_app/app/services/portador_service.dart';
import 'package:despesas_app/app/services/usuario_service.dart';
import 'package:despesas_app/app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  //controllers e objetos que serão compartilhados em todo o app
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => LoginController()),
        Bind((i) => HomeController()),
        Bind((i) => AuthService(i.get())),
        Bind((i) => PortadorService(i.get())),
        Bind((i) => LancamentoService(i.get())),
        Bind((i) => HomeService(i.get())),
        Bind((i) => PlanoService(i.get())),
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
        Bind((i) => PlanoController()),
        Bind((i) => NovoPlanoController()),
        Bind((i) => NovaDespesaController()),
        Bind((i) => NovaReceitaController()),
        Bind((i) => NovoPortadorController()),
        Bind((i) => DuplicataService(i.get())),
        Bind((i) => SettingsController()),
        Bind((i) => UsuarioService(i.get())),
        Bind((i) => DuplicataController()),
      ];

  //rotas nomeadas
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (__, args) => LoginPage()),
        ChildRoute('/login', child: (__, args) => LoginPage()),
        ChildRoute('/home', child: (__, args) => HomePage()),
        ChildRoute('/settings', child: (__, args) => SettingsPage()),
        ChildRoute('/plano', child: (__, args) => PlanoPage()),
        ChildRoute('/duplicata', child: (__, args) => Duplicata())
      ];
}
