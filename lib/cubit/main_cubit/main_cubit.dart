import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:diabetes_safety/data/data_provider/aut_provider.dart';
import 'package:diabetes_safety/data/data_provider/predict_provider.dart';
import 'package:diabetes_safety/data/repository/database.dart';
import 'package:diabetes_safety/models/profile.dart';
import 'package:flutter/material.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final AuthProvider auth;

  MainCubit(this.auth) : super(MainInitial());
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

  Future<Profile> getProfile() async {
    return await auth
        .getUser(token: Database.database.getString('token')!)
        .then((value) => Profile.fromJson(jsonDecode(value.body)));
  }
}
