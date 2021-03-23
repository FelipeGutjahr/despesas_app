import 'package:despesas_app/app/model/item_card_model.dart';
import 'package:despesas_app/app/pages/body_home/body_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BodyHomePage extends StatelessWidget {

  final controller = Modular.get<BodyHomeController>(); 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 15,
                children: [
                  StreamBuilder(
                    stream: controller.getResultadoMensal,
                    builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                      return getResultadoMensal(context: context, resultado: snapshot.data);
                    }
                  ),
                  StreamBuilder(
                    stream: controller.getGastoRecomendado,
                    builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                      return getGastoRecomendado(context: context, recomendado: snapshot.data);
                    }
                  )
                ],
              ),
              Wrap(
                runSpacing: 10,
                children: [

                  /* CARD TOTAL PAGO */
                  StreamBuilder(
                    stream: controller.getTotalPago,
                    builder: (BuildContext context, AsyncSnapshot<List<ItemCardModel>> snapshot) {
                      return getCard(
                        context: context,
                        title: 'Total pago',
                        textTitleColor: Colors.red[900],
                        backTitleColor: Colors.red[100],
                        textValueColor: Colors.red[900],
                        itens: snapshot.data, 
                      );
                    }
                  ),

                  /* CARD TOTAL RECEBIDO */
                  StreamBuilder(
                    stream: controller.getTotalRecebido,
                    builder: (BuildContext context, AsyncSnapshot<List<ItemCardModel>> snapshot) {
                      return getCard(
                        context: context,
                        title: 'Total recebido',
                        textTitleColor: Colors.green[900],
                        backTitleColor: Colors.green[100],
                        textValueColor: Colors.green[900],
                        itens: snapshot.data,
                      );
                    }
                  ),

                  /* CARD PORTADORES */
                  StreamBuilder(
                    stream: controller.getPortadores,
                    builder: (BuildContext context, AsyncSnapshot<List<ItemCardModel>> snapshot) {
                      return getCard(
                        context: context,
                        title: 'Portadores',
                        textTitleColor: Colors.white,
                        backTitleColor: Colors.blue[900],
                        textValueColor: Colors.black87,
                        itens: snapshot.data,
                      );
                    }
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }

  Widget getCard({
    @required BuildContext context,
    @required String title,
    @required Color textTitleColor,
    @required Color backTitleColor,
    @required Color textValueColor,
    @required List<ItemCardModel> itens
  }){
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width <= 550 ? double.infinity : MediaQuery.of(context).size.width * 0.25 < 400 ? 400 : MediaQuery.of(context).size.width * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: backTitleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)
                    )
                  ),
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: Text(title, style: TextStyle(color: textTitleColor, fontSize: 25)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: itens == null ? Center(child: CircularProgressIndicator()) : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: itens.map((e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          e.value,
                          style: TextStyle(
                            color: textValueColor,
                            fontSize: 20
                          ),
                        ),
                      ],
                    )).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getResultadoMensal({
    BuildContext context,
    double resultado
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Resultado mensal',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        resultado == null ? Container(child: CircularProgressIndicator(), padding: EdgeInsets.all(10)) : Text(
          'R\$ ${resultado.toString()}',
          style: TextStyle(
            color: resultado >= 0 ? Colors.green[300] : Colors.red[300],
            fontSize: MediaQuery.of(context).size.width * 0.05 < 38 ? 38 : MediaQuery.of(context).size.width * 0.05,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }

  Widget getGastoRecomendado({
    BuildContext context,
    double recomendado
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gasto recomendado',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        recomendado == null ? Container(child: CircularProgressIndicator(), padding: EdgeInsets.all(10)) : Text(
          'R\$ ${recomendado.toString()}',
          style: TextStyle(
            color: recomendado >= 0 ? Colors.blue[300] : Colors.red[300],
            fontSize: MediaQuery.of(context).size.width * 0.03 < 22 ? 22 : MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}