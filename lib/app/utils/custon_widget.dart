import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustonWidget {

  /* ALERTA NA TELA */
  static Future<void> showAlertDialog({
    @required BuildContext context,
    @required String title,
    @required String bodyText,
    @required String textConfirmBtn,
    @required void Function() onPressed,
    bool showBtnCancelar = false,
  }){
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(bodyText)
          ),
          actions: <Widget>[
            showBtnCancelar ? TextButton(
              child: Text('Cancelar'),
              onPressed: () => Modular.to.pop()
            ) : Container(),
            TextButton(
              child: Text(textConfirmBtn),
              onPressed: onPressed,
            )
          ],
        );
      },
    );
  }
}