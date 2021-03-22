import 'package:despesas_app/app/pages/body_home/body_home_page.dart';
import 'package:despesas_app/app/pages/home/home_controller.dart';
import 'package:despesas_app/app/pages/novo_lancamento/novo_lancamento_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.drawerKey,
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: NovoLancamentoPage(),
      body: BodyHomePage()
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          GestureDetector(
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
                Padding(padding: EdgeInsets.only(left: 10)),
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
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => null,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.white)
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
        Padding(padding: EdgeInsets.only(left: 10)),
        IconButton(
          icon: Icon(Icons.add, color: Colors.blueAccent),
          onPressed: () => homeController.drawerKey.currentState.openEndDrawer(),
        ),
        Padding(padding: EdgeInsets.only(right: 10))
      ],
    );
  }
}