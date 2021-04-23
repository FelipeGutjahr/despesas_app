import 'package:despesas_app/app/model/usuario_config_model.dart';

class UsuarioModel {
  int id;
  String nome;
  String email;
  DateTime dtCadastro;
  String perfil;
  UsuarioConfigModel usuarioConfigModel;

  UsuarioModel(
      {this.id,
      this.nome,
      this.email,
      this.dtCadastro,
      this.perfil,
      this.usuarioConfigModel});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    dtCadastro = DateTime.parse(json['dt_cadastro']);
    perfil = json['perfil'];
    usuarioConfigModel = json['usuarioConfig'] != null
        ? new UsuarioConfigModel.fromJson(json['usuarioConfig'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['dt_cadastro'] = this.dtCadastro;
    data['perfil'] = this.perfil;
    if (this.usuarioConfigModel != null) {
      data['usuarioConfig'] = this.usuarioConfigModel.toJson();
    }
    return data;
  }
}
