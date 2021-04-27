import 'package:despesas_app/app/model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<void> login(LoginModel loginModel) async {
    Response res = await _dio.post('/login', data: loginModel.toJson());
    var token = res.headers.value('Authorization');
    await gravarToken(token);
  }

  Future gravarToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token_access', token);
    prefs.getString('token_acesss');
  }
}
