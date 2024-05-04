part of 'reminder_cubit.dart';

@immutable
sealed class ReminderState {}

final class ReminderInitial extends ReminderState {}

final class ReminderLoading extends ReminderState {}

final class ReminderSuccess extends ReminderState {}

final class ReminderFail extends ReminderState {
  final String error;
  ReminderFail(this.error);
}

final class ReminderDelete extends ReminderState {}
