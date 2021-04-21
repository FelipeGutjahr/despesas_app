import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(child: Text(bodyText)),
          actions: <Widget>[
            showBtnCancelar
                ? TextButton(
                    child: Text('Cancelar'), onPressed: () => Modular.to.pop())
                : Container(),
            TextButton(
              child: Text(textConfirmBtn),
              onPressed: onPressed,
            )
          ],
        );
      },
    );
  }

  Future<void> showAlertForm(
      {@required BuildContext context,
      @required String title,
      @required Widget form}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(title: Text(title), content: form, scrollable: true);
      },
    );
  }

  /* TEXT FORM FIELD */
  static TextFormField getTextFormField(
      {@required BuildContext context,
      @required String hintText,
      bool enabled = true,
      Function(String) validator,
      Icon prefixIcon,
      var inputFormatters,
      String initialValue = '',
      FocusNode focus,
      FocusNode nextFocus,
      TextInputType keyboardType = TextInputType.text,
      int maxLines = 1,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      Function(String) onChanged,
      Function(String) onSaved}) {
    return TextFormField(
      inputFormatters: inputFormatters == null ? [] : [inputFormatters],
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        prefixIcon: prefixIcon,
      ),
      enabled: enabled,
      validator: validator == null ? (value) => null : validator,
      maxLines: maxLines,
      initialValue: initialValue,
      keyboardType: keyboardType,
      focusNode: focus,
      onEditingComplete: () => FocusScope.of(context).requestFocus(nextFocus),
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }

  /* AUTOCOMPLETE TEXT FORM FIELD PORTADOR */
  static AutoCompleteTextField<PortadorModel>
      getAutocCompleteTextFormFieldPortador({
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
  }) {
    autoCompleteTextField = AutoCompleteTextField<PortadorModel>(
      key: key,
      controller: controller,
      suggestions: suggestions,
      focusNode: focus,
      clearOnSubmit: false,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
          prefixIcon: prefixIcon),
      itemFilter: (item, query) =>
          item.nome.toUpperCase().contains(query.toUpperCase()),
      itemSorter: (a, b) => a.nome.compareTo(b.nome),
      itemSubmitted: itemSubmitted,
      itemBuilder: (context, item) {
        return ListTile(title: Text(item.nome));
      },
    );
    return autoCompleteTextField;
  }

  /*static TypeAheadField getAutocompleteTypeAheadField({
    @required List<PortadorModel> suggestions,
  }) {
    return TypeAheadField<PortadorModel>(
      textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(border: OutlineInputBorder())),
      suggestionsCallback: (pattern) {
        var _list = suggestions.where((element) {
          if (element.nome.toLowerCase() == pattern.toUpperCase()) {return element}
        });
        return _list.toList();
      },
      itemBuilder: (context, suggestion) {},
      onSuggestionSelected: (suggestion) {},
    );
  }*/

  /* AUTOCOMPLETE TEXT FORM FIELD PLANO */
  static AutoCompleteTextField<PlanoModel> getAutocCompleteTextFormFieldPlano({
    @required BuildContext context,
    @required List<PlanoModel> suggestions,
    @required String hintText,
    //@required bool enabled,
    Icon prefixIcon,
    FocusNode focus,
    FocusNode nextFocus,
    GlobalKey<AutoCompleteTextFieldState<PlanoModel>> key,
    @required TextEditingController controller,
    AutoCompleteTextField autoCompleteTextField,
    @required Function(PlanoModel) itemSubmitted,
  }) {
    return AutoCompleteTextField<PlanoModel>(
      key: key,
      controller: controller,
      suggestions: suggestions,
      focusNode: focus,
      clearOnSubmit: false,
      decoration: InputDecoration(
          //enabled: enabled,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
          prefixIcon: prefixIcon),
      itemFilter: (item, query) =>
          item.nome.toUpperCase().contains(query.toUpperCase()),
      itemSorter: (a, b) => a.nome.compareTo(b.nome),
      itemSubmitted: itemSubmitted,
      itemBuilder: (context, item) {
        return ListTile(title: Text(item.nome));
      },
    );
  }

  /* ELEVATED BUTTON */
  static Widget getElevatedButton(
      {@required String text,
      @required Function() onPressed,
      @required bool busy}) {
    return Container(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        child: busy
            ? CircularProgressIndicator(
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white))
            : Text(text, style: TextStyle(color: Colors.white)),
        onPressed: busy ? null : onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)))),
      ),
    );
  }
}
