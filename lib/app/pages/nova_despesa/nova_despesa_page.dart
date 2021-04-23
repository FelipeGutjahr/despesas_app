import 'package:despesas_app/app/pages/nova_despesa/nova_despesa_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

final _controller = Modular.get<NovaDespesaController>();

class NovaDepesaPage {
  page(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Container(
        width: 500.0,
        child: Column(
          children: [
            getCheckBox(),
            getRowDataAndVAlue(context),
            getFieldDataVencimento(context),
            SizedBox(height: 8.0),
            getFieldPortador(context),
            getIsCredito(context),
            SizedBox(height: 8.0),
            getFieldContrapartida(context),
            SizedBox(height: 8.0),
            getFieldHistorico(context),
            SizedBox(height: 8.0),
            getBtnSalvar(context)
          ],
        ),
      ),
    );
  }

  Widget getCheckBox() {
    return Observer(builder: (_) {
      return CheckboxListTile(
        title: Text('Duplicata'),
        value: _controller.getDuplicata,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: _controller.getBusy
            ? null
            : (bool value) => _controller.changeDuplicata(),
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
          validator: (value) {
            if (value.isEmpty || value.length < 10) return 'Data inválida';
          },
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
    return Observer(builder: (_) {
      return CustonWidget.getTextFormField(
          context: context,
          hintText: 'Valor',
          prefixIcon: Icon(Icons.attach_money_rounded),
          keyboardType: TextInputType.number,
          nextFocus: _controller.historicoFocus,
          enabled: !_controller.getBusy,
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
                    enabled: !_controller.getBusy,
                    prefixIcon: Icon(Icons.calendar_today),
                    keyboardType: TextInputType.number,
                    inputFormatters: _controller.maskFormatterData,
                    validator: (value) => (value.isEmpty || value.length < 10)
                        ? 'Data inválida'
                        : null,
                    onSaved: _controller.getDuplicata
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
                    : _controller.lancamentoModel.planoCredito = item.plano;
                _controller.setPortadorHasCredito(item.credito);
              });
    });
  }

  Widget getIsCredito(BuildContext context) {
    return Observer(builder: (_) {
      return (_controller.getPortadorHasCredito && !_controller.getDuplicata)
          ? Column(
              children: [
                CheckboxListTile(
                    title: Text('Pago utilizando crédito'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _controller.getIsCredito,
                    onChanged: _controller.getBusy
                        ? null
                        : (value) => _controller.changeisCredito()),
                Observer(builder: (_) {
                  return _controller.getIsCredito
                      ? CheckboxListTile(
                          title: Text('Parcelado'),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _controller.getIsParcelado,
                          onChanged: _controller.getBusy
                              ? null
                              : (value) => _controller.changeIsParcelado())
                      : Container();
                }),
                Observer(builder: (_) {
                  return _controller.getIsParcelado
                      ? getFieldParcelas(context)
                      : Container();
                })
              ],
            )
          : Container();
    });
  }

  Widget getFieldParcelas(BuildContext context) {
    return Column(
      children: [
        CustonWidget.getTextFormField(
            context: context,
            hintText: 'Parcelas',
            prefixIcon: Icon(Icons.format_list_numbered_rounded),
            keyboardType: TextInputType.number,
            enabled: !_controller.getBusy,
            inputFormatters: _controller.makFormaterParcelas,
            validator: (value) {
              if (_controller.getIsParcelado) {
                if (value.isEmpty || value == '0') {
                  return 'Informe a quantidade de parcelas';
                }
                if (value == '1') {
                  return 'Quantidade inválida';
                }
              }
            },
            onChanged: (value) => _controller.setQtdParcelas(value),
            onSaved: (value) => value.isNotEmpty
                ? _controller.lancamentoModel.qtdParcelas = int.parse(value)
                : null),
      ],
    );
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
                    : _controller.lancamentoModel.planoDebito = item;
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
          enabled: !_controller.getBusy,
          maxLines: 3,
          validator: (value) {
            if (value.isEmpty) return 'Informe o histórico';
          },
          onSaved: (value) => {
                _controller.getDuplicata
                    ? _controller.duplicataModel.observacao = value
                    : _controller.lancamentoModel.historico = value
              });
    });
  }

  Widget getBtnSalvar(BuildContext context) {
    return Observer(builder: (_) {
      return CustonWidget.getElevatedButton(
          text: 'SALVAR',
          onPressed: () => _controller.salvarr(),
          busy: _controller.getBusy);
    });
  }
}
