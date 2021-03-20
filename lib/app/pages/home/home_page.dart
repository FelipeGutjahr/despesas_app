import 'package:despesas_app/app/model/item_card_model.dart';
import 'package:despesas_app/app/pages/nova_despesa/nova_despesa_controller.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final controller = Modular.get<NovaDespesaController>();

  var maskFormatterData = TextInputMask(
    mask: '99/99/9999'
  );

  var maskFormatterValor = TextInputMask(
    mask: '9+999.999,99',
    reverse: true,
    placeholder: '0',
    maxPlaceHolders: 3
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
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
        actions: [
          TextButton(
            child: Text('INCLUIR', style: TextStyle(fontSize: 20)),
            onPressed: () => _drawerKey.currentState.openEndDrawer()
          ),
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
          Padding(padding: EdgeInsets.only(right: 10))
        ],
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.25 < 450 ? 450 : MediaQuery.of(context).size.width * 0.25,
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                TextFormField(
                  inputFormatters: [maskFormatterData],
                  decoration: InputDecoration(
                    hintText: 'Data',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    prefixIcon: Icon(Icons.calendar_today)
                  ),
                  keyboardType: TextInputType.number,
                  onEditingComplete: () => FocusScope.of(context).requestFocus(controller.valorFocus),
                ),
                
                SizedBox(height: 10),
                
                TextFormField(
                  inputFormatters: [maskFormatterValor],
                  decoration: InputDecoration(
                    hintText: 'Valor',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    prefixIcon: Icon(Icons.attach_money_rounded)
                  ),
                  keyboardType: TextInputType.number,
                  onEditingComplete: () => FocusScope.of(context).requestFocus(controller.historicoFocus),
                ),

                SizedBox(height: 10),

                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Histórico',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    prefixIcon: Icon(Icons.history),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            //width: MediaQuery.of(context).size.width * 0.25 < 400 ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width * 0.75,
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getResultadoMensal(context: context, resultado: 789.94),
                Wrap(
                  runSpacing: 10,
                  children: [
                    getCard(
                      context: context,
                      title: 'Total pago',
                      textTitleColor: Colors.red[900],
                      backTitleColor: Colors.red[100],
                      textValueColor: Colors.red[900],
                      itens: [
                        ItemCardModel(title: 'Hoje', value: 'R\$ 15,00'),
                        ItemCardModel(title: 'Este mês', value: 'R\$ 842,31')
                      ],
                    ),
                    getCard(
                      context: context,
                      title: 'Total recebido',
                      textTitleColor: Colors.green[900],
                      backTitleColor: Colors.green[100],
                      textValueColor: Colors.green[900],
                      itens: [
                        ItemCardModel(title: 'Hoje', value: 'R\$ 27,00'),
                        ItemCardModel(title: 'Este mês', value: 'R\$ 1.632,25')
                      ],
                    ),
                    getCard(
                      context: context,
                      title: 'Portadores',
                      textTitleColor: Colors.white,
                      backTitleColor: Colors.blue[900],
                      textValueColor: Colors.black87,
                      itens: [
                        ItemCardModel(title: 'Carteira', value: 'R\$ 20,00'),
                        ItemCardModel(title: 'PicPay', value: 'R\$ 72,01'),
                        ItemCardModel(title: 'Nubank', value: 'R\$ 6,67'),
                        ItemCardModel(title: 'Clear Corretora', value: 'R\$ 150,72')
                      ]
                    )
                  ],
                ),
              ],
            )
          ),
        ),
      )
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
                  child: Column(
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
        Text(
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
}