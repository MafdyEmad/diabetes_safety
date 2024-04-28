part of 'alarm_cubit.dart';

@immutable
sealed class AlarmState {}

final class AlarmInitial extends AlarmState {}

final class AlarmChangeTime extends AlarmState {}
