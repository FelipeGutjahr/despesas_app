import 'package:despesas_app/app/pages/body_home/body_home_page.dart';
import 'package:despesas_app/app/pages/body_plano/body_plano_page.dart';
import 'package:despesas_app/app/pages/home/home_controller.dart';
import 'package:despesas_app/app/pages/novo_lancamento/novo_lancamento_page.dart';
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

  final pages = <Widget>[
    BodyHomePage(),
    BodyPlanoPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.drawerKey,
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      endDrawer: NovoLancamentoPage(),
      body: Observer(
        builder: (_){
          return pages[homeController.getPageIndex];
        }
      )
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          GestureDetector(
            onTap: () => homeController.changePageIndex(0),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/money_icon.png')
                    )
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Despesas',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  )
                ),  
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          MediaQuery.of(context).size.width < 500
          ? IconButton(
            icon: Icon(Icons.format_list_numbered_rounded),
            color: Colors.black54,
            onPressed: () => homeController.changePageIndex(1),
          ) : TextButton(
            child: Text('Plano de contas', style: TextStyle(
              color: Colors.black54,
              fontSize: 17,
              fontWeight: FontWeight.bold
            )),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () => homeController.changePageIndex(1),
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => null,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent)
          ),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/login_image.jpg')
              )
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        IconButton(
          icon: Icon(Icons.add, color: Colors.blueAccent),
          onPressed: () => homeController.drawerKey.currentState.openEndDrawer(),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
      ],
    );
  }
}