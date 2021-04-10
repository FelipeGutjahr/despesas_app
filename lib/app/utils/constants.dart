import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';

const String BASE_URL = 'http://192.168.0.103:8080';

const String TOKEN = 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJndXRqYWhyZmVsaXBlQGdtYWlsLmNvbSIsImV4cCI6MTYxODQ0MzA2OH0.Zif6UwmyRSRGsOnFyFWR4yssK8NOLzZhAfAModG-nI4FbCJ6mxqtWrZ-eOHi9wMCByHdwSdZKVxo2reuatKKiw';

const emailValidator = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

/* listas de retorno para simular conexão com API */
List<PortadorModel> retornoPortadores = [
  PortadorModel(id: 1, nome: 'Nubank', credito: true, limite: 6000.0, plano: PlanoModel(id: 2)),
  PortadorModel(id: 2, nome: 'Clear Corretora', credito: false, limite: 0.0),
  PortadorModel(id: 3, nome: 'Carteira', credito: false, limite: 0.0),
  PortadorModel(id: 4, nome: 'PicPay', credito: false, limite: 0.0),
];

List<PlanoModel> retornoContasPlano = [
  PlanoModel(id: 3, codContabil: '1', nome: 'PicPay')
];