import 'package:bloc/bloc.dart';
import 'package:diabetes_safety/data/repository/database.dart';
import 'package:flutter/material.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  int index = 0;
  void changeScreen(value) {
    index = value;
    emit(MainChangeScreen());
  }

  bool? isDark() => Database.database.getBool('isDark');
  void changeTheme(bool value) async {
    await Database.database.setBool('isDark', value);
    emit(MainChangeTheme());
  }
}
