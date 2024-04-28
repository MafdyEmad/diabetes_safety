import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'expect_state.dart';

class ExpectCubit extends Cubit<ExpectState> {
  ExpectCubit() : super(ExpectInitial());
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
}
