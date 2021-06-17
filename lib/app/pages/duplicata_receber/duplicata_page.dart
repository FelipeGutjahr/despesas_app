import 'package:despesas_app/app/model/duplicata_model.dart';
import 'package:despesas_app/app/pages/duplicata_receber/duplicata_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Duplicata extends StatelessWidget {
  final _controller = Modular.get<DuplicataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Duplicatas'),
      ),
      drawer: CustonWidget.getDrawer(),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [_getFilters(context), _getList(context)],
          )),
    );
  }

  Widget _getFilters(BuildContext context) {
    return Column(
      children: [
        _getChips(),
        Text('Vencimento entre'),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(child: _getDataInicial(context)),
            SizedBox(width: 8.0),
            Expanded(child: _getDataFinal(context))
          ],
        ),
        SizedBox(height: 8.0),
        _getBtnExibir(),
        Divider(),
      ],
    );
  }

  Widget _getChips() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0,
      children: [
        Observer(builder: (_) {
          return InputChip(
              selected: _controller.getReceber,
              selectedColor: Colors.blueAccent,
              label: Text('Receber'),
              onPressed: () => _controller.changeReceber());
        }),
        Observer(builder: (_) {
          return InputChip(
            selected: _controller.getPagar,
            selectedColor: Colors.blueAccent,
            label: Text('Pagar'),
            onPressed: () => _controller.changePagar(),
          );
        }),
      ],
    );
  }

  Widget _getDataInicial(BuildContext context) {
    return Observer(builder: (_) {
      return CustonWidget.getTextFormField(
          prefixIcon: Icon(Icons.date_range_outlined),
          context: context,
          onSaved: (value) {
            if (value.length == 10) {
              var formattedDate = value.split('/');
              DateTime data = new DateTime.utc(int.parse(formattedDate[2]),
                  int.parse(formattedDate[1]), int.parse(formattedDate[0]));
              _controller.dataInicial = data;
            }
          },
          inputFormatters: _controller.maskFormatterData,
          hintText: 'Inicial',
          enabled: !_controller.getBusy,
          validator: (value) =>
              value.isEmpty || value.length < 10 ? 'Data inválida' : null);
    });
  }

  Widget _getDataFinal(BuildContext context) {
    return Observer(builder: (_) {
      return CustonWidget.getTextFormField(
        prefixIcon: Icon(Icons.date_range_outlined),
        context: context,
        onSaved: (value) {
          if (value.length == 10) {
            var formattedDate = value.split('/');
            DateTime data = new DateTime.utc(int.parse(formattedDate[2]),
                int.parse(formattedDate[1]), int.parse(formattedDate[0]));
            _controller.dataFinal = data;
          }
        },
        inputFormatters: _controller.maskFormatterData,
        hintText: 'Final',
        validator: (value) =>
            value.isEmpty || value.length < 10 ? 'Data inválida' : null,
        enabled: !_controller.getBusy,
      );
    });
  }

  Widget _getBtnExibir() {
    return Observer(builder: (_) {
      return CustonWidget.getElevatedButton(
          text: 'EXIBIR',
          onPressed: () => _controller.buscarComFiltros(),
          busy: _controller.getBusy);
    });
  }

  Widget _getList(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: StreamBuilder(
          stream: _controller.getDuplicatas,
          builder: (BuildContext context,
              AsyncSnapshot<List<DuplicataModel>> snapshot) {
            return snapshot.hasData
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: snapshot.data.map((e) => _getItem(e)).toList(),
                  )
                : Container();
          }),
    );
  }

  Widget _getItem(DuplicataModel duplicataModel) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(duplicataModel.dataVencimento.toString(),
                    style: TextStyle(fontSize: 17))),
            Expanded(
                child: Text(duplicataModel.valor.toString(),
                    style: TextStyle(fontSize: 17))),
            Expanded(
                child: Text(duplicataModel.saldo.toString(),
                    style: TextStyle(fontSize: 17))),
            Expanded(
                child: CustonWidget.getTextButton(
                    text: 'Pagar', onPressed: () => null))
          ],
        ),
        Divider(),
      ],
    );
  }
}
