import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/pages/novo_lancamento/novo_lancamento_page.dart';
import 'package:despesas_app/app/pages/novo_plano/novo_plano_page.dart';
import 'package:despesas_app/app/pages/plano/plano_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlanoPage extends StatefulWidget {
  @override
  _PlanoPageState createState() => _PlanoPageState();
}

class _PlanoPageState extends State<PlanoPage> {
  final controller = Modular.get<PlanoController>();

  double _width = 0;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width - 50;
    return Container(
        width: _width < 750 ? _width : 750,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(child: getColumn(context)));
  }

  Widget getColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        CustonWidget.getTextFormField(
            context: context,
            hintText: 'Pesquisar',
            prefixIcon: Icon(Icons.search_rounded)),
        SizedBox(height: 8),
        CustonWidget.getElevatedButton(
            text: 'Nova conta',
            onPressed: () async {
              await CustonWidget().showAlertForm(
                  context: context,
                  title: 'Cadastrar nova conta',
                  form: NovoPlanoPage().page(context));
              controller.findPlanos();
            },
            busy: false),
        SizedBox(height: 8),
        StreamBuilder(
            stream: controller.getPlanos,
            builder: (BuildContext context,
                AsyncSnapshot<List<PlanoModel>> snapshot) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: snapshot.hasData
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: snapshot.data.map((e) => getItem(e)).toList(),
                      )
                    : CircularProgressIndicator(),
              );
            }),
      ],
    );
  }

  Widget getItem(PlanoModel planoModel) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Text(planoModel.codContabil,
                    style: TextStyle(fontSize: 17))),
            Expanded(
                flex: 3,
                child: Text(planoModel.nome, style: TextStyle(fontSize: 17))),
          ],
        ),
        Divider()
      ],
    );
  }
}
