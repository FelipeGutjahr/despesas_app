class LoginModel {
  String email;
  String senha;

  LoginModel({
    this.email,
    this.senha
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['email'] = this.email;
    json['senha'] = this.senha;
    return json;
  }
}