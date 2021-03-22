import 'package:despesas_app/app/pages/novo_lancamento/novo_lancamento_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

enum SingingCharacter { receber, pagar }

/* SingingCharacter _character = SingingCharacter.receber; */

class NovoLancamentoPage extends StatefulWidget {

  @override
  _NovoLancamentoPageState createState() => _NovoLancamentoPageState();
}

class _NovoLancamentoPageState extends State<NovoLancamentoPage> {
  
  final novoLancamentoController = Modular.get<NovoLancamentoController>();

  DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25 < 450 ? 450 : MediaQuery.of(context).size.width * 0.25,
      child: Drawer(
        child: Column(
          children: [
            Observer(
              builder: (_){
                return GestureDetector(
                  onTap: novoLancamentoController.changeReceita,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: novoLancamentoController.getReceita ? Colors.green[100] : Colors.red[100],
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        novoLancamentoController.getReceita 
                          ? Text('Nova receita', style: TextStyle(
                              color: Colors.green[900],
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            )
                          ) 
                          : Text('Nova despesa', style: TextStyle(
                              color: Colors.red[900],
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            )
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
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        /* TEXT FIELD DATA */
                        CustonWidget.getTextFormField(
                          context: context,
                          hintText: 'Data',
                          prefixIcon: Icon(Icons.calendar_today),
                          keyboardType: TextInputType.number,
                          nextFocus: novoLancamentoController.valorFocus,
                          inputFormatters: novoLancamentoController.maskFormatterData,
                          initialValue: DateFormat("dd/MM/yyyy").format(data)
                        ),
                        SizedBox(height: 10),

                        /* TEXT FIELD VALOR */
                        CustonWidget.getTextFormField(
                          context: context,
                          hintText: 'Valor',
                          prefixIcon: Icon(Icons.attach_money_rounded),
                          keyboardType: TextInputType.number,
                          nextFocus: novoLancamentoController.historicoFocus,
                          focus: novoLancamentoController.valorFocus,
                          inputFormatters: novoLancamentoController.maskFormatterValor
                        ),
                        SizedBox(height: 10),

                        /* TEXT FIELD HISTORICO  */
                        CustonWidget.getTextFormField(
                          context: context,
                          hintText: 'Histórico',
                          prefixIcon: Icon(Icons.history),
                          keyboardType: TextInputType.number,
                          focus: novoLancamentoController.historicoFocus,
                          maxLines: 3
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}