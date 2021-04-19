import 'package:despesas_app/app/pages/novo_plano/novo_plano_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

final _controller = Modular.get<NovoPlanoController>();

class NovoPlanoPage {
  page(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Column(
        children: [
          CustonWidget.getTextFormField(
              context: context,
              hintText: 'Código contábil',
              inputFormatters: _controller.maskCodContabil,
              onSaved: (value) => _controller.planoModel.codContabil = value,
              validator: (value) =>
                  value.isEmpty ? 'Informe o código contábil' : null),
          SizedBox(height: 8),
          CustonWidget.getTextFormField(
              context: context,
              hintText: 'Nome',
              onSaved: (value) => _controller.planoModel.nome = value,
              validator: (value) => value.isEmpty ? 'Informe o nome' : null),
          getCheckBoxIsCredito(),
          SizedBox(height: 8),
          CustonWidget.getElevatedButton(
              text: 'SALVAR',
              onPressed: () => _controller.salvar(),
              busy: false)
        ],
      ),
    );
  }

  Widget getCheckBoxIsCredito() {
    return Observer(builder: (_) {
      return CheckboxListTile(
        title: Text('Listar no DRE?'),
        value: _controller.getIsDre,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool value) => _controller.changeIsDre(),
      );
    });
  }
}
