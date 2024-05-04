part of 'sugar_cubit.dart';

@immutable
sealed class SugarState {}

final class SugarInitial extends SugarState {}

final class SugarChangeMealType extends SugarState {}

final class SugarChangeSugarValue extends SugarState {}

final class SugarLoading extends SugarState {}

final class SugarSuccess extends SugarState {}

final class SugarFail extends SugarState {
  final String error;
  SugarFail(this.error);
}

final class SugarDelete extends SugarState {}
