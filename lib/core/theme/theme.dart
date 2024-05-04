import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:flutter/material.dart';

const cardTheme = CardTheme(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
);
const elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppPalette.primaryButtonColorLight)));
ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: AppPalette.cardColorLight),
    colorScheme: const ColorScheme.light(
      background: AppPalette.backgroundColorLight,
    ),
    datePickerTheme: const DatePickerThemeData(
      headerBackgroundColor: AppPalette.primaryButtonColorLight,
    ),
    scaffoldBackgroundColor: AppPalette.backgroundColorLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppPalette.drawerIconColorLight),
    ),
    snackBarTheme: const SnackBarThemeData(backgroundColor: AppPalette.cardColorLight),
    drawerTheme: const DrawerThemeData(backgroundColor: AppPalette.cardColorLight),
    cardTheme: cardTheme,
    cardColor: AppPalette.cardColorLight,
    elevatedButtonTheme: elevatedButtonTheme,
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppPalette.primaryButtonColorLight),
    dialogBackgroundColor: AppPalette.backgroundColorLight,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 24, color: AppPalette.primaryTextColorLight),
      displayMedium: TextStyle(fontSize: 18, color: AppPalette.primaryTextColorLight),
      displaySmall: TextStyle(fontSize: 16, color: AppPalette.secondaryTextColorLight),
    ));
//--------------------------------------------------dark ------------------------------------------------
ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    colorScheme: const ColorScheme.dark(
      background: AppPalette.backgroundColorLight,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: AppPalette.cardColorDark),
    drawerTheme: const DrawerThemeData(backgroundColor: AppPalette.cardColorDark),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppPalette.drawerIconColorDark),
    ),
    dialogBackgroundColor: AppPalette.backgroundColorDark,
    scaffoldBackgroundColor: AppPalette.backgroundColorDark,
    cardTheme: cardTheme,
    cardColor: AppPalette.cardColorDark,
    elevatedButtonTheme: elevatedButtonTheme,
    snackBarTheme: const SnackBarThemeData(backgroundColor: AppPalette.cardColorDark),
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppPalette.primaryButtonColorLight),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 24, color: AppPalette.primaryTextColorDark),
      displayMedium: TextStyle(fontSize: 18, color: AppPalette.primaryTextColorDark),
      displaySmall: TextStyle(fontSize: 16, color: AppPalette.secondaryTextColorDark),
    ));
