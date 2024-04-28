import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool isPasswordShown = false;
  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    emit(AuthChangePasswordVisibility());
  }
}
