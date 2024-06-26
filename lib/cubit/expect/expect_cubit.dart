import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:diabetes_safety/data/data_provider/predict_provider.dart';
import 'package:flutter/material.dart';

part 'expect_state.dart';

class ExpectCubit extends Cubit<ExpectState> {
  final PredictionProvider prediction;
  ExpectCubit(this.prediction) : super(ExpectInitial());
  bool isMale = true;
  bool haveBloodPressure = false;
  bool haveHeartDisease = false;
  final List<String> smokeTypes = ['مدخن', 'مقلع عن التدخين', 'غير مدخن'];
  String smokeValue = 'مدخن';
  void changeGender(bool value) {
    isMale = value;
    emit(ExpectChangeGender());
  }

  void changeHaveHeartDisease(bool value) {
    haveHeartDisease = value;
    emit(ExpectChangeRadioButton());
  }

  void changeHaveBloodPressure(bool value) {
    haveBloodPressure = value;
    emit(ExpectChangeRadioButton());
  }

  void changeSmoke(String value) {
    smokeValue = value;
    emit(ExpectChangeSmokeValue());
  }

  Future predict({
    required int age,
    required double bmi,
    required double hba1cLevel,
    required double bloodGlucoseLevel,
  }) async {
    emit(ExpectLoading());
    try {
      final response = await prediction.predict(
        gender: isMale == true ? 1 : 0,
        age: age,
        hypertension: haveBloodPressure == true ? 1 : 0,
        heartDisease: haveHeartDisease == true ? 1 : 0,
        smoking: smokeTypes.indexOf(smokeValue),
        bmi: bmi,
        hba1cLevel: hba1cLevel,
        bloodGlucoseLevel: bloodGlucoseLevel,
      );

      emit(ExpectSuccess(jsonDecode(response.body)['result']));
    } catch (e) {
      emit(ExpectFail("حدث خطأ"));
    }
  }
}
