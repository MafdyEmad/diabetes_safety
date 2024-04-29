import 'package:diabetes_safety/core/utile/api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthProvider {
  Future<Response> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await http.post(
        Uri.parse(AppEndPoints.register),
        body: {
          "name": name,
          "email": email,
          "password": password,
        },
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> login({
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await http.post(
        Uri.parse(AppEndPoints.login),
        body: {
          "username": email,
          "password": password,
        },
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
