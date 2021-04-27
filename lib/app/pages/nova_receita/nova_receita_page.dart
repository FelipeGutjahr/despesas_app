import 'package:despesas_app/app/pages/nova_receita/nova_receita_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

final _controller = Modular.get<NovaReceitaController>();

class NovaReceitaPage {
  Future<void> showForm(BuildContext context) {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nova receita'),
          content: getForm(context),
          scrollable: true,
        );
      },
    );
  }

  getForm(BuildContext context) {
    return Form(
        key: _controller.formKey,
        child: Container(
          width: 500,
          child: Column(
            children: [
              getCheckBox(),
              getRowDataAndVAlue(context),
              getFieldDataVencimento(context),
              SizedBox(height: 8.0),
              getFieldPortador(context),
              SizedBox(height: 8.0),
              getFieldContrapartida(context),
              SizedBox(height: 8.0),
              getFieldHistorico(context),
              SizedBox(height: 8.0),
              getBtnSalvar()
            ],
          ),
        ));
  }

  Widget getCheckBox() {
    return Observer(builder: (_) {
      return Column(
        children: [
          CheckboxListTile(
            title: Text('Duplicata'),
            value: _controller.getDuplicata,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: _controller.getBusy
                ? null
                : (bool value) => _controller.changeDuplicata(),
          ),
          _controller.getDuplicata
              ? getCheckBoxSemRecebimentoPrevisto()
              : Container()
        ],
      );
    });
  }

  Widget getCheckBoxSemRecebimentoPrevisto() {
    return Observer(builder: (_) {
      return CheckboxListTile(
        title: Text('Sem previsão de recebimento'),
        value: _controller.getDuplicataSemRecebimentoPrevisto,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: _controller.getBusy
            ? null
            : (bool value) =>
                _controller.changeDuplicataSemRecebimentoPrevisto(),
      );
    });
  }

  Widget getRowDataAndVAlue(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: getFieldData(context)),
        SizedBox(width: 8.0),
        Expanded(child: getFieldValor(context))
      ],
    );
  }

  Widget getFieldData(BuildContext context) {
    return Observer(builder: (_) {
      return CustonWidget.getTextFormField(
          context: context,
          hintText: _controller.getDuplicata ? 'Data de inclusão' : 'Data',
          prefixIcon: Icon(Icons.calendar_today),
          keyboardType: TextInputType.number,
          nextFocus: _controller.valorFocus,
          enabled: !_controller.getBusy,
          inputFormatters: _controller.maskFormatterData,
          validator: (value) =>
              (value.isEmpty || value.length < 10) ? 'Data inválida' : null,
          onSaved: (value) {
            var formattedDate = value.split('/');
            DateTime data = new DateTime.utc(int.parse(formattedDate[2]),
                int.parse(formattedDate[1]), int.parse(formattedDate[0]));
            _controller.getDuplicata
                ? _controller.duplicataModel.dataInclusao = data
                : _controller.lancamentoModel.data = data;
          });
    });
  }

  Widget getFieldValor(BuildContext context) {
    return CustonWidget.getTextFormField(
        context: context,
        hintText: 'Valor',
        prefixIcon: Icon(Icons.attach_money_rounded),
        keyboardType: TextInputType.number,
        nextFocus: _controller.historicoFocus,
        focus: _controller.valorFocus,
        validator: (value) => value.isEmpty ? 'Informe o valor' : null,
        inputFormatters: _controller.maskFormatterValor,
        onSaved: (value) {
          _controller.getDuplicata
              ? _controller.duplicataModel.valor = double.parse(value
                  .replaceAll(RegExp(r'\.'), '')
                  .replaceAll(RegExp(r','), '.'))
              : _controller.lancamentoModel.valor = double.parse(value
                  .replaceAll(RegExp(r'\.'), '')
                  .replaceAll(RegExp(r','), '.'));
        });
  }

  Widget getFieldDataVencimento(BuildContext context) {
    return Observer(builder: (_) {
      return _controller.getDuplicata
          ? Column(
              children: [
                SizedBox(height: 8.0),
                CustonWidget.getTextFormField(
                    context: context,
                    hintText: 'Data de vencimento',
                    prefixIcon: Icon(Icons.calendar_today),
                    keyboardType: TextInputType.number,
                    inputFormatters: _controller.maskFormatterData,
                    enabled: !_controller.getDuplicataSemRecebimentoPrevisto,
                    validator: (value) =>
                        ((value.isEmpty || value.length < 10) &&
                                !_controller.getDuplicataSemRecebimentoPrevisto)
                            ? 'Data inválida'
                            : null,
                    onSaved: _controller.getDuplicata &&
                            _controller.getDuplicataSemRecebimentoPrevisto
                        ? null
                        : (value) {
                            var formattedDate = value.split('/');
                            DateTime data = new DateTime.utc(
                                int.parse(formattedDate[2]),
                                int.parse(formattedDate[1]),
                                int.parse(formattedDate[0]));
                            _controller.duplicataModel.dataVencimento = data;
                          })
              ],
            )
          : Container();
    });
  }

  Widget getFieldPortador(BuildContext context) {
    return Observer(builder: (_) {
      return (_controller.getPortadores.isEmpty || _controller.getBusy)
          ? CustonWidget.getTextFormField(
              context: context,
              hintText: 'Portador',
              enabled: false,
              initialValue: _controller.portadorController.text,
              prefixIcon: Icon(Icons.account_balance_rounded))
          : CustonWidget.getAutocCompleteTextFormFieldPortador(
              context: context,
              suggestions: _controller.getPortadores,
              hintText: 'Portador',
              prefixIcon: Icon(Icons.account_balance_rounded),
              controller: _controller.portadorController,
              itemSubmitted: (item) {
                _controller.portadorController.text = item.nome;
                _controller.getDuplicata
                    ? _controller.duplicataModel.portador = item
                    : _controller.lancamentoModel.planoDebito = item.plano;
              });
    });
  }

  Widget getFieldContrapartida(BuildContext context) {
    return Observer(builder: (_) {
      return (_controller.getPlanos.isEmpty || _controller.getBusy)
          ? CustonWidget.getTextFormField(
              context: context,
              hintText: 'Contrapartida',
              enabled: false,
              initialValue: _controller.planoController.text,
              prefixIcon: Icon(Icons.account_balance_rounded))
          : CustonWidget.getAutocCompleteTextFormFieldPlano(
              context: context,
              suggestions: _controller.getPlanos,
              hintText: 'Contrapartida',
              prefixIcon: Icon(Icons.account_balance_rounded),
              itemSubmitted: (item) {
                _controller.planoController.text = item.nome;
                _controller.getDuplicata
                    ? _controller.duplicataModel.plano = item
                    : _controller.lancamentoModel.planoCredito = item;
              },
              controller: _controller.planoController);
    });
  }

  Widget getFieldHistorico(BuildContext context) {
    return Observer(builder: (_) {
      return CustonWidget.getTextFormField(
          context: context,
          hintText: _controller.getDuplicata ? 'Observação' : 'Histórico',
          prefixIcon: Icon(Icons.history),
          focus: _controller.historicoFocus,
          maxLines: 3,
          validator: (value) {
            if (value.isEmpty)
              return _controller.getDuplicata
                  ? 'Informe a observação'
                  : 'Informe o histórico';
          },
          onSaved: (value) => {
                _controller.getDuplicata
                    ? _controller.duplicataModel.observacao = value
                    : _controller.lancamentoModel.historico = value
              });
    });
  }

  Widget getBtnSalvar() {
    return Observer(builder: (_) {
      return CustonWidget.getElevatedButton(
          text: 'SALVAR',
          onPressed: () => _controller.salvar(),
          busy: _controller.getBusy);
    });
  }
}
