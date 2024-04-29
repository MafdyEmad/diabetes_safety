import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:diabetes_safety/data/data_provider/aut_provider.dart';
import 'package:diabetes_safety/data/repository/database.dart';
import 'package:diabetes_safety/models/erorr.dart';
import 'package:flutter/material.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late final AuthProvider auth;
  AuthCubit(this.auth) : super(AuthInitial());
  bool isPasswordShown = false;
  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    emit(AuthChangePasswordVisibility());
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final result = await auth.register(name: name, email: email, password: password);
      final jsonData = jsonDecode(result.body);
      if (result.statusCode == 200) {
        await _saveUser(jsonData['access']);
        emit(AuthSuccess());
      } else if (result.statusCode == 400) {
        emit(AuthFail(ErrorModel.fromJson(jsonData).error));
      } else {
        emit(AuthFail('حدث خطأ'));
      }
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }

  Future login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final result = await auth.login(email: email, password: password);
      final jsonData = jsonDecode(result.body);

      if (result.statusCode == 200) {
        await _saveUser(jsonData['access']);
        emit(AuthSuccess());
      } else if (result.statusCode == 401) {
        emit(AuthFail(ErrorModel.fromJson(jsonData).error));
      } else {
        emit(AuthFail('حدث خطأ'));
      }
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }

  Future<void> _saveUser(token) async {
    await Database.database.setString('token', token);
  }
}
