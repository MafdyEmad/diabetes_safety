class Prediction {
  int gender;
  int age;
  int hypertension;
  int heartDisease;
  int smoking;
  double bmi;
  double hba1cLevel;
  double bloodGlucoseLevel;

  Prediction({
    required this.gender,
    required this.age,
    required this.hypertension,
    required this.heartDisease,
    required this.smoking,
    required this.bmi,
    required this.hba1cLevel,
    required this.bloodGlucoseLevel,
  });

  // factory Prediction.fromJson(Map<String, dynamic> json) {
  //   return Prediction(
  //     gender: json['gender'],
  //     age: json['age'],
  //     hypertension: json['hypertension'],
  //     heartDisease: json['heart_disease'],
  //     smokingHistory: json['smoking_history'],
  //     bmi: json['bmi'].toDouble(),
  //     hba1cLevel: json['HbA1c_level'].toDouble(),
  //     bloodGlucoseLevel: json['blood_glucose_level'].toDouble(),
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      "gender": gender.toString(),
      "age": age.toString(),
      "hypertension": hypertension.toString(),
      "heart_disease": heartDisease.toString(),
      "smoking_history": smoking.toString(),
      "bmi": bmi.toString(),
      "HbA1c_level": hba1cLevel.toString(),
      "blood_glucose_level": bloodGlucoseLevel.toString()
    };
  }
}
