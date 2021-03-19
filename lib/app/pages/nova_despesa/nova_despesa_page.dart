import 'package:despesas_app/app/pages/nova_despesa/nova_despesa_controller.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NovaDespesa extends StatefulWidget {

  @override
  _NovaDespesaState createState() => _NovaDespesaState();
}

class _NovaDespesaState extends State<NovaDespesa> {

  final controller = Modular.get<NovaDespesaController>();
  
  var maskFormatterData = TextInputMask(
    mask: '99/99/9999'
  );

  var maskFormatterValor = TextInputMask(
    mask: '9+999.999,99',
    reverse: true,
    placeholder: '0',
    maxPlaceHolders: 3
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1,
      child: Container(
        width: 1000,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('Nova despesa', style: TextStyle(fontSize: 48, color: Colors.black87, fontWeight: FontWeight.bold)),
            leading: Container(),
            leadingWidth: 0,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(height: 10),
                TextFormField(
                  inputFormatters: [maskFormatterData],
                  decoration: InputDecoration(
                    hintText: 'Data da despesa',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    prefixIcon: Icon(Icons.calendar_today)
                  ),
                  keyboardType: TextInputType.number,
                  onEditingComplete: () => FocusScope.of(context).requestFocus(controller.valorFocus),
                ),

                SizedBox(height: 10),

                TextFormField(
                  inputFormatters: [maskFormatterValor],
                  decoration: InputDecoration(
                    hintText: 'Valor',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    prefixIcon: Icon(Icons.attach_money_rounded)
                  ),
                  keyboardType: TextInputType.number,
                  focusNode: controller.valorFocus,
                  onEditingComplete: () => FocusScope.of(context).requestFocus(controller.historicoFocus),
                ),

                SizedBox(height: 10),

                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Histórico',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    prefixIcon: Icon(Icons.history),
                  ),
                  focusNode: controller.historicoFocus,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}