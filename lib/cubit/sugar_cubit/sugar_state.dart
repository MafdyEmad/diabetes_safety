part of 'sugar_cubit.dart';

@immutable
sealed class SugarState {}

final class SugarInitial extends SugarState {}

final class SugarChangeMealType extends SugarState {}

final class SugarChangeSugarValue extends SugarState {}
