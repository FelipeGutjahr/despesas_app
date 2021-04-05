import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';

const String BASE_URL = 'http://192.168.1.101:8080';

const String TOKEN = 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJndXRqYWhyZmVsaXBlQGdtYWlsLmNvbSIsImV4cCI6MTYxNzgxMDExMH0.nYqyJU6Jy6UbzaQNSOLGpdKDLjX08lrurm0Hgbuz1y436BtG8EZE-986BLmbxN7UpIa_gegnyAyCuCEFrLVgYA';

const emailValidator = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

/* listas de retorno para simular conexão com API */
List<PortadorModel> retornoPortadores = [
  PortadorModel(id: 1, nome: 'Nubank', credito: true, limite: 6000.0),
  PortadorModel(id: 2, nome: 'Clear Corretora', credito: false, limite: 0.0),
  PortadorModel(id: 3, nome: 'Carteira', credito: false, limite: 0.0),
  PortadorModel(id: 4, nome: 'PicPay', credito: false, limite: 0.0),
];

List<PlanoModel> retornoContasPlano = [
  PlanoModel(codContabil: '1', nome: 'ATIVO'),
  PlanoModel(codContabil: '1.01', nome: 'ATIVO CIRCULANTE'),
  PlanoModel(codContabil: '1.01.01', nome: 'ATIVO CIRCULANTE LIQUIDO'),
  PlanoModel(codContabil: '1.01.01.01', nome: 'Clear Corretora'),
  PlanoModel(codContabil: '1.01.01.02', nome: 'Nubank'),
  PlanoModel(codContabil: '1.01.01.02', nome: 'Sicoob')
];