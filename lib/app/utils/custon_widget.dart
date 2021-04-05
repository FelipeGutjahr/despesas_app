import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';
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

  /* AUTOCOMPLETE TEXT FORM FIELD PORTADOR */
  static AutoCompleteTextField<PortadorModel> getAutocCompleteTextFormFieldPortador({
    @required BuildContext context,
    @required List<PortadorModel> suggestions,
    @required String hintText,
    Icon prefixIcon,
    FocusNode focus,
    FocusNode nextFocus,
    GlobalKey<AutoCompleteTextFieldState<PortadorModel>> key,
    @required TextEditingController controller,
    AutoCompleteTextField autoCompleteTextField,
    @required Function(PortadorModel) itemSubmitted,
  }){
    autoCompleteTextField = AutoCompleteTextField<PortadorModel>(
      key: key,
      controller: controller,
      suggestions: suggestions,
      focusNode: focus,
      clearOnSubmit: false,
      style: TextStyle(color: Colors.black87, fontSize: 16.0),
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        prefixIcon: prefixIcon
      ),
      itemFilter: (item, query) => item.nome.toUpperCase().contains(query.toUpperCase()),
      itemSorter: (a, b) => a.nome.compareTo(b.nome),
      itemSubmitted: itemSubmitted,
      itemBuilder: (context, item) {
        return ListTile(title: Text(item.nome));
      },
    );
    return autoCompleteTextField;
  }

  /* AUTOCOMPLETE TEXT FORM FIELD PORTADOR */
  static AutoCompleteTextField<PlanoModel> getAutocCompleteTextFormFieldPlano({
    @required BuildContext context,
    @required List<PlanoModel> suggestions,
    @required String hintText,
    Icon prefixIcon,
    FocusNode focus,
    FocusNode nextFocus,
    GlobalKey<AutoCompleteTextFieldState<PlanoModel>> key,
    @required TextEditingController controller,
    AutoCompleteTextField autoCompleteTextField,
    @required Function(PlanoModel) itemSubmitted,
  }){
    autoCompleteTextField = AutoCompleteTextField<PlanoModel>(
      key: key,
      controller: controller,
      suggestions: suggestions,
      focusNode: focus,
      clearOnSubmit: false,
      style: TextStyle(color: Colors.black87, fontSize: 16.0),
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        prefixIcon: prefixIcon
      ),
      itemFilter: (item, query) => item.nome.toUpperCase().contains(query.toUpperCase()),
      itemSorter: (a, b) => a.nome.compareTo(b.nome),
      itemSubmitted: itemSubmitted,
      itemBuilder: (context, item) {
        return ListTile(title: Text(item.nome));
      },
    );
    return autoCompleteTextField;
  }

  /* ELEVATED BUTTON */
  static Widget getElevatedButton({
    @required String text,
    @required Function() onPressed,
    @required bool busy
  }) {
    return Container(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        child: busy
          ? CircularProgressIndicator(valueColor: const AlwaysStoppedAnimation<Color>(Colors.white)) 
          : Text(text, style: TextStyle(color: Colors.white)),
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
          )
        ),
      ),
    );
  }
}