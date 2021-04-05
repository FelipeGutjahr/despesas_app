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
          //tamanho será a metade da tela e de no minimo 800
          width: MediaQuery.of(context).size.width * 0.5 < 800 ? 800 : MediaQuery.of(context).size.width * 0.5,
          child: getColumn(context)
        ),
      ),
    );
  }

  Widget getColumn(BuildContext context) {
    return Column(
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
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'CÓD CONTÁBIL',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(
                            'CONTA',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'DRE?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                  getTile(snapshot.data)
                ],
              );
            }
          }
        )
      ],
    );
  }

  Widget getTile(List<PlanoModel> contas) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: contas.map((e) => Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(e.codContabil),
                ),
                Expanded(
                  flex: 7,
                  child: Text(e.nome),
                ),
                /* Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(e.dre ? 'SIM' : 'NÃO')
                  ),
                ) */
              ],
            )
          ],
        )).toList(),
      ),
    );
  }
}