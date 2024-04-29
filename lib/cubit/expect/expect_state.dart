part of 'expect_cubit.dart';

@immutable
sealed class ExpectState {}

final class ExpectInitial extends ExpectState {}

final class ExpectChangeGender extends ExpectState {}

final class ExpectChangeRadioButton extends ExpectState {}

final class ExpectChangeSmokeValue extends ExpectState {}

final class ExpectLoading extends ExpectState {}

final class ExpectFail extends ExpectState {
  final String error;

  ExpectFail(this.error);
}

final class ExpectSuccess extends ExpectState {
  final String value;

  ExpectSuccess(this.value);
}
