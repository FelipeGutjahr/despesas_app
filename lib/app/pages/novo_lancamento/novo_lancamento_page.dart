import 'package:despesas_app/app/pages/novo_lancamento/novo_lancamento_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

enum SingingCharacter { receber, pagar }

/* SingingCharacter _character = SingingCharacter.receber; */

class NovoLancamentoPage extends StatefulWidget {

  @override
  _NovoLancamentoPageState createState() => _NovoLancamentoPageState();
}

class _NovoLancamentoPageState extends State<NovoLancamentoPage> {
  
  final controller = Modular.get<NovoLancamentoController>();

  TextEditingController portadorController = TextEditingController();
  TextEditingController planoController = TextEditingController();

  /* @override
  void initState() {
    controller.valorFocus.requestFocus();
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;

    return Container(
      // drawer irá ocupar 25% da tela, com tamanho minimo de 400 na versão WEB, 
      // no Android irá ocupar toda a tela
      width: kIsWeb ? _width * 0.25 < 400 ? 400 : _width * 0.25 : _width,
      child: Drawer(
        child: Column(
          children: [
            getTopContainer(),
            getBodyDrawer(_width)
          ],
        ),
      ),
    );
  }

  Widget getBodyDrawer(double _width){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getForm(_width),
            getBtnSalvar()
          ],
        ),
      )
    );
  }

  Widget getForm(double _width) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: getFieldData()
              ),
              SizedBox(width: 10),
              Expanded(
                child: getFieldValor()
              )
            ],
          ),
          SizedBox(height: 10),
          getFieldPortador(),
          Observer(
            builder: (_){
              return controller.getReceita ? SizedBox(height: 10) : getCreditoForm();
            },
          ),
          getFieldContrapartida(),
          SizedBox(height: 10),
          getFieldHistorico()
        ],
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

  Widget getFieldData(){
    return CustonWidget.getTextFormField(
      context: context,
      hintText: 'Data',
      prefixIcon: Icon(Icons.calendar_today),
      keyboardType: TextInputType.number,
      nextFocus: controller.valorFocus,
      inputFormatters: controller.maskFormatterData,
      /* initialValue: DateFormat("dd/MM/yyyy").format(controller.data), */
      validator: (value){
        if(value.isEmpty || value.length < 10) return 'Data inválida';
      },
      onSaved: (value) {
        var formattedDate = value.split('/');
        DateTime data = new DateTime.utc(int.parse(formattedDate[2]), int.parse(formattedDate[1]), int.parse(formattedDate[0]));
        controller.lancamentoModel.data = data;
      }
    );
  }

  Widget getFieldValor(){
    return CustonWidget.getTextFormField(
      context: context,
      hintText: 'Valor',
      prefixIcon: Icon(Icons.attach_money_rounded),
      keyboardType: TextInputType.number,
      nextFocus: controller.historicoFocus,
      focus: controller.valorFocus,
      validator: (value){
        if(value.isEmpty) return 'Informe o valor';
      },
      inputFormatters: controller.maskFormatterValor,
      onChanged: (value) => controller.setValor(value)
    );
  }

  Widget getFieldPortador(){
    return Observer(
      builder: (_){
        return CustonWidget.getAutocCompleteTextFormFieldPortador(
          context: context,
          suggestions: controller.getPortadores,
          hintText: 'Portador',
          prefixIcon: Icon(Icons.account_balance_rounded),
          itemSubmitted: (item) {
            portadorController.text = item.nome;
            controller.getReceita ? controller.lancamentoModel.planoDebito = item.plano : controller.lancamentoModel.planoCredito = item.plano;
          },
          controller: portadorController
        );
      }
    );
  }

  Widget getFieldContrapartida(){
    return CustonWidget.getAutocCompleteTextFormFieldPlano(
      context: context,
      suggestions: controller.getContas,
      hintText: 'Contrapartida',
      prefixIcon: Icon(Icons.account_balance_rounded),
      itemSubmitted: (item) {
        planoController.text = item.nome;
        controller.getReceita ? controller.lancamentoModel.planoCredito = item : controller.lancamentoModel.planoDebito = item;
      },
      controller: planoController
    );
  }

  Widget getFieldHistorico(){
    return CustonWidget.getTextFormField(
      context: context,
      hintText: 'Histórico',
      prefixIcon: Icon(Icons.history),
      focus: controller.historicoFocus,
      maxLines: 3,
      validator: (value){
        if(value.isEmpty) return 'Informe o histórico';
      },
      onSaved: (value) => controller.lancamentoModel.historico = value
    );
  }

  Widget getCreditoForm(){
    return Column(
      children: [
        getCheckBoxIsCredito(),
        Observer(
          builder: (_){
            return controller.getIsCredito ?  getCheckBoxIsParcelado() : Container(height: 0.0, width: 0.0);
          },
        ),
        Observer(
          builder: (_){
            return controller.getIsParcelado ? getFieldParcelas() : Container(height: 0.0, width: 0.0);
          },
        )
      ],
    );
  }

  Widget getCheckBoxIsCredito() {
    return Observer(
      builder: (_){
        return CheckboxListTile(
          title: Text('Pago utilizando crédito'),
          value: controller.getIsCredito,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (bool value) => controller.changeisCredito(),
        );
      }
    );
  }

  Widget getCheckBoxIsParcelado() {
    return Observer(
      builder: (_){
        return CheckboxListTile(
          title: Text('Parcelado'),
          value: controller.getIsParcelado,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (bool value) => controller.changeIsParcelado(),
        );
      }
    );
  }

  Widget getFieldParcelas(){
    return Column(
      children: [
        CustonWidget.getTextFormField(
          context: context,
          hintText: 'Parcelas',
          prefixIcon: Icon(Icons.format_list_numbered_rounded),
          keyboardType: TextInputType.number,
          inputFormatters: controller.makFormaterParcelas,
          validator: (value){
            if(controller.getIsParcelado){
              if(value.isEmpty || value == '0'){
                return 'Informe a quantidade de parcelas';
              }
              if(value == '1'){
                return 'Quantidade inválida';
              }
            }
          },
          onChanged: (value) => controller.setQtdParcelas(value),
          onSaved: (value) => value.isNotEmpty ? controller.lancamentoModel.qtdParcelas = int.parse(value) : null
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget getBtnSalvar(){
    return Container(
      child: Column(
        children: [
          Observer(
            builder: (_){
              return controller.getIsParcelado ? Text(
                controller.getResultadoParcelas != null && !controller.getReceita ? 'Pago em ${controller.getQtdParcelas}x de R\$${controller.getResultadoParcelas}' : ''
              ) : Container(height: 0.0, width: 0.0);
            },
          ),
          SizedBox(height: 5),
          Observer(
            builder: (_) {
              return CustonWidget.getElevatedButton(
                text: 'SALVAR', 
                onPressed: () => controller.salvar(),
                busy: controller.getBusy
              );
            },
          ),
        ],
      ),
    );
  }
}