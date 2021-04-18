import 'package:despesas_app/app/pages/body_home/body_home_page.dart';
import 'package:despesas_app/app/pages/home/home_controller.dart';
import 'package:despesas_app/app/pages/novo_lancamento/novo_lancamento_page.dart';
import 'package:despesas_app/app/pages/plano/plano_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  final pages = <Widget>[BodyHomePage(), PlanoPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: homeController.drawerKey,
        appBar: getAppBar(),
        endDrawer: getEndDrawer(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getLeftColumn(),
            Observer(builder: (_) {
              return pages[homeController.getPageIndex];
            }),
            Container()
          ],
        ));
  }

  getLeftColumn() {
    return Column(
      children: [
        Column(
          children: [
            IconButton(
                icon: Icon(Icons.home_rounded, size: 30),
                onPressed: () => homeController.changePageIndex(0)),
            IconButton(
                icon: Icon(Icons.format_list_numbered_rounded, size: 30),
                onPressed: () => homeController.changePageIndex(1))
          ],
        ),
      ],
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 1,
      leading: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/money_icon.png'))),
      ),
      centerTitle: true,
      title: Text('Despesas',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      actions: getActions(),
    );
  }

  List<Widget> getActions() {
    return [IconButton(icon: Icon(Icons.settings), onPressed: () => null)];
  }

  Widget getEndDrawer() {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: NovoLancamentoPage()),
    );
  }
}
