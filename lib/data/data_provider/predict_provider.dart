import 'package:diabetes_safety/core/utile/api.dart';
import 'package:diabetes_safety/data/repository/database.dart';
import 'package:diabetes_safety/models/prediction.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PredictionProvider {
  Future<Response> predict({
    required int gender,
    required int age,
    required int hypertension,
    required int heartDisease,
    required int smoking,
    required double bmi,
    required double hba1cLevel,
    required double bloodGlucoseLevel,
  }) async {
    try {
      final Response response = await http.post(Uri.parse(AppEndPoints.predict),
          body: Prediction(
            gender: gender,
            age: age,
            hypertension: hypertension,
            heartDisease: heartDisease,
            smoking: smoking,
            bmi: bmi,
            hba1cLevel: hba1cLevel,
            bloodGlucoseLevel: bloodGlucoseLevel,
          ).toJson(),
          headers: {'Authorization': 'Bearer ${Database.database.getString('token')!}'});
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
