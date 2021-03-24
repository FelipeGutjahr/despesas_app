import 'package:despesas_app/app/model/portador_model.dart';
import 'package:despesas_app/app/pages/novo_lancamento/novo_lancamento_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

enum SingingCharacter { receber, pagar }

/* SingingCharacter _character = SingingCharacter.receber; */

class NovoLancamentoPage extends StatefulWidget {

  @override
  _NovoLancamentoPageState createState() => _NovoLancamentoPageState();
}

class _NovoLancamentoPageState extends State<NovoLancamentoPage> {
  
  final controller = Modular.get<NovoLancamentoController>();

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;

    return Container(
      // drawer irá ocupar 25% da tela, com tamanho minimo de 450 na versão WEB, 
      // no Android irá ocupar toda a tela
      width: kIsWeb ? _width * 0.25 < 450 ? 450 : _width * 0.25 : _width,
      child: Drawer(
        child: Column(
          children: [
            getTopContainer(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getForm(_width),
                    CustonWidget.getElevatedButton(
                      text: 'SALVAR', 
                      onPressed: () => controller.salvar()
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget getTopContainer() {
    return Observer(
      builder: (_){
        return GestureDetector(
          onTap: controller.changeReceita,
          child: Container(
            color: controller.getReceita ? Colors.green[100] : Colors.red[100],
            padding: EdgeInsets.all(8),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.getReceita ? 'Nova receita' : 'Nova despesa',
                  style: TextStyle(
                    color: controller.getReceita ? Colors.green[900] : Colors.red[900],
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Modular.to.pop(),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget getForm(double _width) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Row(
            children: [

              /* TEXT FIELD DATA */
              Expanded(
                child: CustonWidget.getTextFormField(
                  context: context,
                  hintText: 'Data',
                  prefixIcon: Icon(Icons.calendar_today),
                  keyboardType: TextInputType.number,
                  nextFocus: controller.valorFocus,
                  inputFormatters: controller.maskFormatterData,
                  initialValue: DateFormat("dd/MM/yyyy").format(controller.data),
                  validator: true
                ),
              ),
              SizedBox(width: 10),

              /* TEXT FIELD VALOR */
              Expanded(
                child: CustonWidget.getTextFormField(
                  context: context,
                  hintText: 'Valor',
                  prefixIcon: Icon(Icons.attach_money_rounded),
                  keyboardType: TextInputType.number,
                  nextFocus: controller.historicoFocus,
                  focus: controller.valorFocus,
                  inputFormatters: controller.maskFormatterValor,
                  validator: true
                ),
              )
            ],
          ),
          SizedBox(height: 10),

          /* AUTOCOMPLETE TEXT FIELD PORTADOR */
          CustonWidget.getAutocCompleteTextFormField(
            context: context,
            suggestions: controller.getPortadores,
            hintText: 'Portador',
            prefixIcon: Icon(Icons.account_balance_rounded),
            itemSubmitted: (item) => controller.lancamentoModel.portador = PortadorModel(id: item.id)
          ),
          SizedBox(height: 10),

          /* AUTOCOMPLETE TEXT FIELD CONTA RECEITA/DESPESA */
          CustonWidget.getAutocCompleteTextFormField(
            context: context,
            suggestions: controller.getPortadores,
            hintText: 'Portador',
            prefixIcon: Icon(Icons.account_balance_rounded),
            itemSubmitted: (item) => null
          ),
          SizedBox(height: 10),

          /* TEXT FIELD HISTORICO  */
          CustonWidget.getTextFormField(
            context: context,
            hintText: 'Histórico',
            prefixIcon: Icon(Icons.history),
            keyboardType: TextInputType.number,
            focus: controller.historicoFocus,
            maxLines: 3,
            validator: true
          ),
        ],
      ),
    );
  }
}