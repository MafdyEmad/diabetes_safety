import 'package:diabetes_safety/core/utile/api.dart';
import 'package:diabetes_safety/data/repository/database.dart';
import 'package:diabetes_safety/models/sugar.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SugarProvider {
  Future<Response> addSugar({required int body, required int meal}) async {
    try {
      final Response response = await http.post(Uri.parse(AppEndPoints.addSugar),
          body: Sugar(body: body, meal: meal).toJson(),
          headers: {'Authorization': 'Bearer ${Database.database.getString('token')!}'});
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> getSugars() async {
    try {
      final Response response = await http.get(Uri.parse(AppEndPoints.getSugars),
          headers: {'Authorization': 'Bearer ${Database.database.getString('token')!}'});
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> deleteSugars(String id) async {
    try {
      final Response response = await http.delete(Uri.parse('${AppEndPoints.deleteSugar}$id/'),
          headers: {'Authorization': 'Bearer ${Database.database.getString('token')!}'});
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
