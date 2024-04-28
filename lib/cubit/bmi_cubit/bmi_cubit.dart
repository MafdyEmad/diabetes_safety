import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());
  bool isMale = true;
  double height = 150.0;
  int weight = 70;
  int age = 25;
  double bmi = 0;
  void changeGender(bool value) {
    isMale = value;
    emit(BmChangeGender());
  }

  void changeSliderValue(double value) {
    height = value;
    emit(BmChangeSliderValue());
  }

  void changeWeight(bool increase) {
    increase ? weight++ : weight--;
    emit(BmChangeWeight());
  }

  void changeAge(bool increase) {
    increase ? age++ : age--;
    emit(BmChangeAge());
  }

  void calculateBMI() {
    final heightInM = height / 100;

    final value = weight / (heightInM * heightInM);
    bmi = double.parse(value.toStringAsFixed(1));
    emit(BmCalcBMI());
  }
}
