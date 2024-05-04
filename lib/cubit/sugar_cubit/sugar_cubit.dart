import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:diabetes_safety/data/data_provider/sugar_provider.dart';
import 'package:diabetes_safety/models/sugar.dart';
import 'package:flutter/cupertino.dart';

part 'sugar_state.dart';

class SugarCubit extends Cubit<SugarState> {
  final SugarProvider sugar;
  SugarCubit(this.sugar) : super(SugarInitial());
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

  Future addSugar() async {
    emit(SugarLoading());
    try {
      await sugar.addSugar(body: sugarValue, meal: mealType);
      emit(SugarSuccess());
    } catch (e) {
      emit(SugarFail(e.toString()));
    }
  }

  Future<List<Sugar>> getSugars() async {
    List<Sugar> sugars = [];
    final response = await sugar.getSugars();
    for (final sugar in jsonDecode(response.body)) {
      sugars.add(Sugar.fromJson(sugar));
    }
    return sugars;
  }

  Future deleteSugar(String id) async {
    try {
      await sugar.deleteSugars(id);
      emit(SugarDelete());
    } catch (e) {}
  }
}
