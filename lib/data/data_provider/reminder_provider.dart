import 'package:diabetes_safety/core/utile/api.dart';
import 'package:diabetes_safety/data/repository/database.dart';
import 'package:diabetes_safety/models/reminder.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ReminderProvider {
  Future<Response> makeReminder({required String name, required int type, required DateTime date}) async {
    try {
      final Response response = await http.post(Uri.parse(AppEndPoints.addReminder),
          body: Reminder(name: name, type: type, date: date).toJson(),
          headers: {'Authorization': 'Bearer ${Database.database.getString('token')!}'});
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> getReminders() async {
    try {
      final Response response = await http.get(Uri.parse(AppEndPoints.getReminders),
          headers: {'Authorization': 'Bearer ${Database.database.getString('token')!}'});
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> deleteReminder(String id) async {
    try {
      final Response response = await http.delete(Uri.parse('${AppEndPoints.deleteReminder}$id/'),
          headers: {'Authorization': 'Bearer ${Database.database.getString('token')!}'});
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
