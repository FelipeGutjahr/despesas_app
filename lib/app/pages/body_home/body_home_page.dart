import 'package:despesas_app/app/model/item_card_model.dart';
import 'package:despesas_app/app/pages/body_home/body_home_controller.dart';
import 'package:despesas_app/app/pages/nova_despesa/nova_despesa_page.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BodyHomePage extends StatefulWidget {
  @override
  _BodyHomePageState createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  final _controller = Modular.get<BodyHomeController>();

  double _width = 0;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width - 50;
    return getBody();
  }

  getBody() {
    return Container(
      width: _width,
      alignment: Alignment.topCenter,
      child: Wrap(
        runAlignment: WrapAlignment.spaceBetween,
        children: [
          /* CARD TOTAL PAGO */
          StreamBuilder(
              stream: _controller.getTotalPago,
              builder: (BuildContext context,
                  AsyncSnapshot<List<ItemCardModel>> snapshot) {
                return getCard(
                    context: context,
                    title: 'Total pago',
                    textTitleColor: Colors.red,
                    backTitleColor: Colors.transparent,
                    textValueColor: Colors.white,
                    itens: snapshot.data,
                    addIcon: Icon(Icons.add_rounded),
                    onPressed: () async {
                      await CustonWidget().showAlertForm(
                          context: context,
                          title: 'Nova despesa',
                          form: NovaDepesaPage().page(context));
                      _controller.findAll();
                    });
              }),

          /* CARD TOTAL RECEBIDO */
          StreamBuilder(
              stream: _controller.getTotalRecebido,
              builder: (BuildContext context,
                  AsyncSnapshot<List<ItemCardModel>> snapshot) {
                return getCard(
                  context: context,
                  title: 'Total recebido',
                  textTitleColor: Colors.green,
                  backTitleColor: Colors.transparent,
                  textValueColor: Colors.white,
                  itens: snapshot.data,
                );
              }),

          /* CARD PORTADORES */
          StreamBuilder(
              stream: _controller.getPortadores,
              builder: (BuildContext context,
                  AsyncSnapshot<List<ItemCardModel>> snapshot) {
                return getCard(
                  context: context,
                  title: 'Portadores',
                  textTitleColor: Colors.white,
                  backTitleColor: Colors.transparent,
                  textValueColor: Colors.white,
                  itens: snapshot.data,
                );
              }),
        ],
      ),
    );
  }

  Widget getCard(
      {@required BuildContext context,
      @required String title,
      @required Color textTitleColor,
      @required Color backTitleColor,
      @required Color textValueColor,
      @required List<ItemCardModel> itens,
      Icon addIcon,
      void Function() onPressed}) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width <= 550
                ? double.infinity
                : MediaQuery.of(context).size.width * 0.25 < 400
                    ? 400
                    : MediaQuery.of(context).size.width * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: backTitleColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5))),
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      child: Text(title,
                          style:
                              TextStyle(color: textTitleColor, fontSize: 25)),
                    ),
                    (addIcon != null && onPressed != null)
                        ? IconButton(icon: addIcon, onPressed: onPressed)
                        : Container()
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(itens == null ? 8 : 0),
                  child: itens == null
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: itens
                              .map((e) => ListTile(
                                    title: Text(
                                      e.title,
                                    ),
                                    subtitle: Text(
                                      e.value,
                                      style: TextStyle(
                                          color: textValueColor, fontSize: 20),
                                    ),
                                  ))
                              .toList(),
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getResultadoMensal({BuildContext context, double resultado}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Resultado mensal',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        resultado == null
            ? Container(
                child: CircularProgressIndicator(), padding: EdgeInsets.all(10))
            : Text(
                'R\$ ${resultado.toString()}',
                style: TextStyle(
                  color: resultado >= 0 ? Colors.green[400] : Colors.red[400],
                  fontSize: MediaQuery.of(context).size.width * 0.05 < 38
                      ? 38
                      : MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
  }

  Widget getGastoRecomendado({BuildContext context, double recomendado}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gasto recomendado',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        recomendado == null
            ? Container(
                child: CircularProgressIndicator(), padding: EdgeInsets.all(10))
            : Text(
                'R\$ ${recomendado.toString()}',
                style: TextStyle(
                    color:
                        recomendado >= 0 ? Colors.blue[400] : Colors.red[400],
                    fontSize: MediaQuery.of(context).size.width * 0.03 < 22
                        ? 22
                        : MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.bold),
              ),
      ],
    );
  }
}
