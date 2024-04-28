import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
part 'alarm_state.dart';

class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit() : super(AlarmInitial());

  String getTime({DateTime? date, TimeOfDay? time}) {
    final format = DateFormat('dd MMMM yyyy, hh:mm a', 'ar');
    if (date != null && time != null) {
      final fullDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
      return format.format(fullDate);
    } else {
      return '';
    }
  }

  void changeTime() {
    emit(AlarmChangeTime());
  }
}
