part of 'expect_cubit.dart';

@immutable
sealed class ExpectState {}

final class ExpectInitial extends ExpectState {}

final class ExpectChangeGender extends ExpectState {}

final class ExpectChangeRadioButton extends ExpectState {}

final class ExpectChangeSmokeValue extends ExpectState {}
