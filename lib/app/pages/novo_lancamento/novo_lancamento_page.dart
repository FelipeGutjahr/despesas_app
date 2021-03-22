import 'package:despesas_app/app/pages/novo_lancamento/novo_lancamento_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

enum SingingCharacter { receber, pagar }

SingingCharacter _character = SingingCharacter.receber;

class NovoLancamentoPage extends StatefulWidget {

  @override
  _NovoLancamentoPageState createState() => _NovoLancamentoPageState();
}

class _NovoLancamentoPageState extends State<NovoLancamentoPage> {
  
  final novoLancamentoController = Modular.get<NovoLancamentoController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25 < 450 ? 450 : MediaQuery.of(context).size.width * 0.25,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: SingingCharacter.receber,
                        groupValue: _character,
                        onChanged: (SingingCharacter value){
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      Text('Receber')
                    ],
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Radio(
                        value: SingingCharacter.pagar,
                        groupValue: _character,
                        onChanged: (SingingCharacter value){
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      Text('Pagar')
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),

              /* TEXT FIELD DATA */
              CustonWidget.getTextFormField(
                context: context,
                hintText: 'Data',
                prefixIcon: Icon(Icons.calendar_today),
                keyboardType: TextInputType.number,
                nextFocus: novoLancamentoController.valorFocus,
                inputFormatters: novoLancamentoController.maskFormatterData
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
      ),
    );
  }
}