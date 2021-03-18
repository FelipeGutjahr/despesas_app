import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NovaDespesa extends StatefulWidget {

  @override
  _NovaDespesaState createState() => _NovaDespesaState();
}

class _NovaDespesaState extends State<NovaDespesa> {
  
  var maskFormatterData = new MaskTextInputFormatter(
    mask: '##/##/####',
    filter: { "#": RegExp(r'[0-9]') }
  );

  var maskFormatterValor = new MaskTextInputFormatter(
    mask: 'R\$ ##,##',
    filter: { "#": RegExp(r'[0-9]') }
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1,
      child: Container(
        width: 1000,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Nova despesa',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 48,
                fontWeight: FontWeight.bold
              )
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 0,
          ),
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                inputFormatters: [maskFormatterData],
                decoration: InputDecoration(
                  hintText: 'Data da despesa',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                  prefixIcon: Icon(Icons.calendar_today)
                ),
              ),

              TextFormField(
                inputFormatters: [maskFormatterValor],
                decoration: InputDecoration(
                  hintText: 'Valor',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                  prefixIcon: Icon(Icons.attach_money_rounded)
                ),
              ),

              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Histórico',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                  prefixIcon: Icon(Icons.history)
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}