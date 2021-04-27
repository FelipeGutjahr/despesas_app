import 'package:despesas_app/app/pages/novo_portador/novo_portador_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

final _controller = Modular.get<NovoPortadorController>();

class NovoPortadorPage {
  Future<void> showForm(BuildContext context) {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Novo portador'),
          content: getForm(context),
          scrollable: true,
        );
      },
    );
  }

  Widget getForm(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Container(
        width: 500,
        child: Column(
          children: [
            getFieldNome(context),
            SizedBox(height: 8.0),
            getFieldContrapartida(context),
            SizedBox(height: 8.0),
            getFieldSaldo(context),
            getCheckBox(context),
            SizedBox(height: 8.0),
            getBtnSalvar()
          ],
        ),
      ),
    );
  }

  Widget getFieldNome(BuildContext context) {
    return Observer(builder: (_) {
      return CustonWidget.getTextFormField(
          context: context,
          hintText: 'Nome',
          enabled: !_controller.getBusy,
          validator: (value) => value.isEmpty ? 'Informe o nome' : null,
          onSaved: (value) => _controller.portadorModel.nome = value);
    });
  }

  Widget getFieldContrapartida(BuildContext context) {
    return Observer(builder: (_) {
      return _controller.getPlanos.isEmpty
          ? CustonWidget.getTextFormField(
              context: context, hintText: 'Conta', enabled: false)
          : CustonWidget.getAutocCompleteTextFormFieldPlano(
              context: context,
              suggestions: _controller.getPlanos,
              hintText: 'Conta',
              itemSubmitted: (item) {
                _controller.planoController.text = item.nome;
                _controller.portadorModel.plano = item;
              },
              controller: _controller.planoController);
    });
  }

  Widget getFieldSaldo(BuildContext context) {
    return Observer(builder: (_) {
      return CustonWidget.getTextFormField(
          context: context,
          hintText: 'Saldo atual',
          enabled: !_controller.getBusy,
          validator: (value) => value.isEmpty ? 'Informe o saldo' : null,
          onSaved: (value) => _controller.portadorModel.nome = value);
    });
  }

  Widget getCheckBox(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          CheckboxListTile(
            title: Text('Possuí crédito'),
            value: _controller.getHasCredito,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: _controller.getBusy
                ? null
                : (bool value) => _controller.changeHasCredito(),
          ),
          _controller.getHasCredito ? getFieldLimite(context) : Container()
        ],
      );
    });
  }

  Widget getFieldLimite(BuildContext context) {
    return Observer(builder: (_) {
      return CustonWidget.getTextFormField(
          context: context,
          hintText: 'Limite',
          enabled: !_controller.getBusy,
          inputFormatters: _controller.maskLimite,
          validator: (value) => (value.isEmpty || value == '0')
              ? 'Informe um limite válido'
              : null,
          onSaved: (value) =>
              _controller.portadorModel.limite = double.parse(value));
    });
  }

  Widget getBtnSalvar() {
    return Observer(builder: (_) {
      return CustonWidget.getElevatedButton(
          text: 'SALVAR',
          onPressed: () => _controller.salvarTeste(),
          busy: _controller.getBusy);
    });
  }
}
