part of 'bmi_cubit.dart';

@immutable
sealed class BmiState {}

final class BmiInitial extends BmiState {}

final class BmChangeGender extends BmiState {}

final class BmChangeSliderValue extends BmiState {}

final class BmChangeWeight extends BmiState {}

final class BmChangeAge extends BmiState {}

final class BmCalcBMI extends BmiState {}
