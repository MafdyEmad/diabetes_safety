import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'sugar_state.dart';

class SugarCubit extends Cubit<SugarState> {
  SugarCubit() : super(SugarInitial());
  int mealType = 0;
  int sugarValue = 200;
  void changeMealType(int value) {
    mealType = value;
    emit(SugarChangeMealType());
  }

  void changeSugarValue(bool isIncrease) {
    isIncrease ? sugarValue++ : sugarValue--;
    emit(SugarChangeSugarValue());
  }
}
