import 'package:despesas_app/app/model/auto_complete_text_field_model.dart';
import 'package:despesas_app/app/model/plano_model.dart';

const emailValidator = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

/* listas de retorno para simular conexão com API */
List<AutoCompleteTextFieldModel> retornoPortadores = [
  AutoCompleteTextFieldModel(id: 1, nome: 'Nubank'),
  AutoCompleteTextFieldModel(id: 2, nome: 'Clear Corretora'),
  AutoCompleteTextFieldModel(id: 3, nome: 'Carteira'),
  AutoCompleteTextFieldModel(id: 4, nome: 'PicPay'),
];

List<PlanoModel> retornoContasPlano = [
  PlanoModel(codContabil: '1', nome: 'ATIVO', dre: false),
  PlanoModel(codContabil: '1.01', nome: 'ATIVO CIRCULANTE', dre: false),
  PlanoModel(codContabil: '1.01.01', nome: 'ATIVO CIRCULANTE LIQUIDO', dre: false),
  PlanoModel(codContabil: '1.01.01.01', nome: 'Clear Corretora', dre: false),
  PlanoModel(codContabil: '1.01.01.02', nome: 'Nubank', dre: true),
  PlanoModel(codContabil: '1.01.01.02', nome: 'Sicoob', dre: true)
];