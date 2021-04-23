class UsuarioConfigModel {
  int primeiroDiaMes;

  UsuarioConfigModel({this.primeiroDiaMes});

  UsuarioConfigModel.fromJson(Map<String, dynamic> json) {
    primeiroDiaMes = json['primeiroDiaMes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primeiroDiaMes'] = this.primeiroDiaMes;
    return data;
  }
}
