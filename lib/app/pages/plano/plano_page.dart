import 'package:despesas_app/app/model/plano_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _getAppBar(),
        drawer: CustonWidget.getDrawer(),
        body: _getBody(context),
        floatingActionButton: _getFloatingActionButton());
  }

  Widget _getAppBar() {
    return AppBar(centerTitle: true, title: Text('Plano de contas'));
  }

  Widget _getFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add_rounded),
      onPressed: () async {
        await CustonWidget().showAlertForm(
            context: context,
            title: 'Cadastrar nova conta',
            form: NovoPlanoPage().page(context));
        controller.findPlanos();
      },
    );
  }

  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: StreamBuilder(
            stream: controller.getPlanos,
            builder: (BuildContext context,
                AsyncSnapshot<List<PlanoModel>> snapshot) {
              return snapshot.hasData
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: snapshot.data.map((e) => getItem(e)).toList(),
                    )
                  : CircularProgressIndicator();
            }),
      ),
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
