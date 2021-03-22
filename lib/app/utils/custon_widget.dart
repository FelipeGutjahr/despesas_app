import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustonWidget {

  var defaultMask = TextInputMask(mask: 'X*X');

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

  /* TEXT FORM FIELD */
  static TextFormField getTextFormField({
    @required BuildContext context,
    @required String hintText,
    bool validator = false,
    Icon prefixIcon,
    var inputFormatters,
    String initialValue = '',
    FocusNode focus,
    FocusNode nextFocus,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    TextCapitalization textCapitalization = TextCapitalization.sentences
  }) {
    return TextFormField(
      inputFormatters: inputFormatters == null ? [] : [inputFormatters],
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        prefixIcon: prefixIcon, 
      ),
      validator: (value){
        if(validator && value.isEmpty) {
          return 'Campo obrigatório';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      initialValue: initialValue,
      keyboardType: keyboardType,
      focusNode: focus,
      onEditingComplete: () => FocusScope.of(context).requestFocus(nextFocus),
      textCapitalization: textCapitalization,
    );
  }
}