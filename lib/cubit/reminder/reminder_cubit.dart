import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:diabetes_safety/data/data_provider/reminder_provider.dart';
import 'package:diabetes_safety/models/reminder.dart';
import 'package:flutter/material.dart';

part 'reminder_state.dart';

class ReminderCubit extends Cubit<ReminderState> {
  final ReminderProvider reminder;
  ReminderCubit(this.reminder) : super(ReminderInitial());
  Future makeReminder({required String name, required int type, required DateTime date}) async {
    emit(ReminderLoading());
    try {
      await reminder.makeReminder(name: name, type: type, date: date);
      emit(ReminderSuccess());
    } catch (e) {
      emit(ReminderFail(e.toString()));
    }
  }

  Future<List<Reminder>> getReminders() async {
    List<Reminder> reminders = [];
    final response = await reminder.getReminders();
    for (final reminder in jsonDecode(response.body)) {
      reminders.add(Reminder.fromJson(reminder));
    }

    return reminders;
  }

  Future deleteReminder(String id) async {
    try {
      await reminder.deleteReminder(id);
      emit(ReminderDelete());
    } catch (e) {}
  }
}
