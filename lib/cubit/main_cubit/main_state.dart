part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class MainChangeScreen extends MainState {}

final class MainChangeTheme extends MainState {}
