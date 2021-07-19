import 'package:despesas_app/app/config.dart';
import 'package:despesas_app/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cDarkBlue1,
      body: Body(ctrl: controller),
    );
  }
}

class Body extends StatelessWidget {
  final HomeController ctrl;
  const Body({Key key, @required this.ctrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ctrl.setSize(MediaQuery.of(context).size);
    return Stack(
      children: [
        Observer(
          builder: (_) {
            return Row(
              children: [
                // Drawer na esquerda
                if (ctrl.getShowDrawer)
                  Container(
                    height: ctrl.getFullHeight,
                    width: ctrl.getDrawerWidth,
                    decoration: BoxDecoration(
                        color: cDarkBlue2,
                        border: Border(
                            right: BorderSide(color: Colors.black, width: 1))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // foto de perfil
                        Container(
                          height: 86,
                          margin: EdgeInsets.only(top: 115),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.blueAccent, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: cBlueberry,
                                    blurRadius: 5,
                                    spreadRadius: -1)
                              ],
                              image: DecorationImage(
                                  alignment: Alignment.bottomCenter,
                                  image: AssetImage(
                                      'assets/images/perfil_image.png'),
                                  fit: BoxFit.contain)),
                        ),
                        // nome de usuário
                        Container(
                          height: 50,
                          alignment: Alignment.bottomCenter,
                          child: Text('Allen Clerk',
                              style: GoogleFonts.arimo(
                                  letterSpacing: 0.5,
                                  fontSize: 18,
                                  color: cWhite2,
                                  fontWeight: FontWeight.bold)),
                        ), // nome de usuário
                        // receita mensal atual - talvez será alterado para outra informação
                        Container(
                          height: 30,
                          alignment: Alignment.bottomCenter,
                          child: Text('R\$3.400,00',
                              style: GoogleFonts.arimo(
                                  letterSpacing: 0.5,
                                  fontSize: 18,
                                  color: cGray1)),
                        ), // receita mensal atual
                        Container(
                          width: 178,
                          margin: EdgeInsets.only(top: 22),
                          padding: EdgeInsets.only(top: 20, bottom: 12),
                          child: Text(tPrincipal.toUpperCase(),
                              style: GoogleFonts.arimo(
                                  letterSpacing: 0.5,
                                  fontSize: 10,
                                  color: cGray1)),
                        ),
                        // primeiro item do menu
                        MouseRegion(
                          onEnter: (PointerEvent event) {
                            ctrl.changeSelectItem1();
                          },
                          onExit: (PointerEvent event) {
                            ctrl.changeSelectItem1();
                          },
                          child: TextButton(
                            onPressed: () {
                              print('Teste');
                            },
                            child: Container(
                              color: cDarkBlue2,
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              alignment: Alignment.center,
                              height: 41,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Icon(Icons.data_usage,
                                      size: 17, color: cBlueberry),
                                  Observer(
                                    builder: (_) {
                                      return AnimatedContainer(
                                        duration: Duration(milliseconds: 250),
                                        width: ctrl.getSelectItem1 ? 20 : 15,
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                  Text(
                                    tDashboard,
                                    style: GoogleFonts.arimo(
                                        height: 1.2,
                                        letterSpacing: 0.4,
                                        fontSize: 13,
                                        color: cBlueberry),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ), // primeiro item do menu
                        // Primeiro painel expancivel
                        MouseRegion(
                          onEnter: (PointerEvent event) {
                            ctrl.changeSelectItem2();
                          },
                          onExit: (PointerEvent event) {
                            ctrl.changeSelectItem2();
                          },
                          child: TextButton(
                            onPressed: () {
                              ctrl.changeExpandedPanel1();
                            },
                            child: Container(
                              color: ctrl.getExpandedPanel1
                                  ? cDarkBlue3
                                  : cDarkBlue2,
                              padding: EdgeInsets.only(left: 30, right: 18),
                              alignment: Alignment.center,
                              height: 41,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Observer(
                                        builder: (_) {
                                          return Row(
                                            children: [
                                              Icon(Icons.account_balance,
                                                  size: 17,
                                                  color: ctrl.getSelectItem2
                                                      ? cBlueberry
                                                      : cWhite2),
                                              AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 250),
                                                width: ctrl.getSelectItem2
                                                    ? 20
                                                    : 15,
                                                curve: Curves.ease,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Text(
                                        tLancamentos,
                                        style: GoogleFonts.arimo(
                                            height: 1.2,
                                            letterSpacing: 0.4,
                                            fontSize: 13,
                                            color: cWhite2),
                                      )
                                    ],
                                  ),
                                  Icon(
                                    ctrl.getExpandedPanel1
                                        ? Icons.expand_more
                                        : Icons.chevron_right,
                                    color: cWhite2,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ), // Primeiro painel expancivel
                        // Itens do painel quando expandido
                        Observer(
                          builder: (_) {
                            return ctrl.getExpandedPanel1
                                ? Column(
                                    children: [
                                      MouseRegion(
                                        child: TextButton(
                                          onPressed: () {
                                            print('Teste');
                                          },
                                          child: Container(
                                            color: cDarkBlue3,
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 62, top: 10),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      tReceita,
                                                      style: GoogleFonts.arimo(
                                                          letterSpacing: 0.4,
                                                          fontSize: 13,
                                                          color: cGray1),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      MouseRegion(
                                        child: TextButton(
                                          onPressed: () {
                                            print('Teste');
                                          },
                                          child: Container(
                                            color: cDarkBlue3,
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 62, top: 10),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      tDespesa,
                                                      style: GoogleFonts.arimo(
                                                          letterSpacing: 0.4,
                                                          fontSize: 13,
                                                          color: cGray1),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Container();
                          },
                        ) // Itens do painel expandido
                      ],
                    ),
                  ), // Drawer na esquerda
                // Corpo principal da tela selecionada
                Container(
                  alignment: Alignment.topCenter,
                  width: ctrl.getWidthBackBodyContainer,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    width: ctrl.getBodyWidth,
                    margin: EdgeInsets.only(top: 84),
                    // Coluna com os itens da tela
                    child: Column(
                      children: [
                        // Container com os títulos
                        Container(
                          height: 134,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tDashboard,
                                  style: GoogleFonts.arimo(
                                      fontSize: 23,
                                      color: cWhite2,
                                      letterSpacing: 0.4)),
                              SizedBox(height: 3.1),
                              Text(tBemVindo + ', Allen Clerk',
                                  style: GoogleFonts.arimo(
                                      fontSize: 14,
                                      letterSpacing: 0.4,
                                      color: cWhite1))
                            ],
                          ),
                        ), // Container com os títulos
                        Wrap(
                          spacing: 9,
                          runSpacing: 9,
                          children: [
                            Card(
                              elevation: 15,
                              margin: EdgeInsets.all(0),
                              shadowColor: cDarkBlue2,
                              color: cDarkBlue2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                height: 123,
                                width: ctrl.getWidthCard,
                                /*decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(7))*/
                              ),
                            ),
                            Card(
                              elevation: 15,
                              margin: EdgeInsets.all(0),
                              shadowColor: cDarkBlue2,
                              color: cDarkBlue2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                height: 123,
                                width: ctrl.getWidthCard,
                                /*decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(7))*/
                              ),
                            ),
                            Card(
                              elevation: 15,
                              margin: EdgeInsets.all(0),
                              shadowColor: cDarkBlue2,
                              color: cDarkBlue2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                height: 123,
                                width: ctrl.getWidthCard,
                                /*decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(7))*/
                              ),
                            ),
                            Card(
                              elevation: 15,
                              margin: EdgeInsets.all(0),
                              shadowColor: cDarkBlue2,
                              color: cDarkBlue2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                height: 123,
                                width: ctrl.getWidthCard,
                                /*decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(7))*/
                              ),
                            )
                          ],
                        ),
                      ],
                    ), // Coluna com os itens da tela
                  ),
                )
              ],
            );
          },
        ),
        // container superior - pesquisa/logo
        Container(
          color: Colors.transparent,
          width: ctrl.getFullWidth,
          alignment: Alignment.center,
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // widgets a esquerda
              Container(
                child: Row(
                  children: [
                    // container drawer/logo
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      width: 237,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // logo
                          Container(
                            height: 21,
                            width: 90,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/logo.png'),
                                    fit: BoxFit.fitHeight)),
                          ), // logo
                          // icone drawer
                          IconButton(
                            icon: Icon(Icons.menu, color: cWhite1),
                            onPressed: () => ctrl.changeShowDrawer(),
                          )
                        ],
                      ),
                    ), // container drawer/logo
                    SizedBox(width: 37),
                    // container de pesquisa
                    Container(
                      height: 40,
                      width: ctrl.getFullWidth * 0.15,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: cDarkBlue2,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          // container botão com seta
                          Container(
                            height: 40,
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: cBlueberry,
                                  blurRadius: 5,
                                  spreadRadius: -1)
                            ], shape: BoxShape.circle, color: cBlueberry),
                            child: Icon(Icons.arrow_forward,
                                color: cWhite2, size: 15),
                          ) // container botão com seta
                        ],
                      ),
                    ) // container de pesquisa
                  ],
                ),
              ), // widgets a esquerda
              // widgets a direita
              Container(
                  child: Row(
                children: [
                  IconButton(
                    icon:
                        Icon(Icons.settings_rounded, color: cWhite1, size: 20),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10)
                ],
              )), // widgets a direita
            ],
          ),
        ), // container superior - pesquisa/logo
      ],
    );
  }
}
