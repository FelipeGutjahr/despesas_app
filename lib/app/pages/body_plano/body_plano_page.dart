import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/pages/body_plano/body_plano_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BodyPlanoPage extends StatelessWidget {

  final planoController = Modular.get<BodyPlanoController>();
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * 0.5 < 800 ? 800 : MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              CustonWidget.getTextFormField(
                context: context,
                hintText: 'Pesquisar conta',
                prefixIcon: Icon(Icons.search),
              ),
              SizedBox(height: 8),
              StreamBuilder(
                stream: planoController.contas,
                builder: (BuildContext context, AsyncSnapshot<List<PlanoModel>> snapshot) {
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  } else if(snapshot.hasError){
                    return Center(
                      child: Column(
                        children: [
                          Icon(Icons.error_outline_rounded, color: Colors.red),
                          SizedBox(height: 8),
                          Text('Ocorreu um erro')
                        ],
                      )
                    );
                  } else {
                    return getTile(snapshot.data);
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getTile(List<PlanoModel> contas) {
    return Column(
      children: contas.map((e) => Column(
        children: [
          //TODO: implementar listagem de contas do plano de contas
        ],
      )).toList(),
    );
  }
}