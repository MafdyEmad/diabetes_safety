import 'package:diabetes_safety/core/theme/theme.dart';
import 'package:diabetes_safety/cubit/alarm_cubit/alarm_cubit.dart';
import 'package:diabetes_safety/cubit/auth/auth_cubit.dart';
import 'package:diabetes_safety/cubit/bmi_cubit/bmi_cubit.dart';
import 'package:diabetes_safety/cubit/expect/expect_cubit.dart';
import 'package:diabetes_safety/cubit/main_cubit/main_cubit.dart';
import 'package:diabetes_safety/cubit/sugar_cubit/sugar_cubit.dart';
import 'package:diabetes_safety/data/repository/database.dart';
import 'package:diabetes_safety/presentation/screens/first_screen.dart';
import 'package:diabetes_safety/presentation/screens/home_screen.dart';
import 'package:diabetes_safety/presentation/screens/login_screen.dart';
import 'package:diabetes_safety/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.init();
  var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  if (Database.database.getBool('isDark') == null) {
    Database.database.setBool('isDark', brightness == Brightness.dark);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
        ),
        BlocProvider(
          create: (context) => BmiCubit(),
        ),
        BlocProvider(
          create: (context) => SugarCubit(),
        ),
        BlocProvider(
          create: (context) => ExpectCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AlarmCubit(),
        ),
      ],
      child: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) => current is MainChangeTheme,
        builder: (context, state) => MaterialApp(
          locale: const Locale('ar'),
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("ar"),
          ],
          theme: Database.database.getBool('isDark') == true ? darkTheme : lightTheme,
          home: MainScreen(),
          // home: FirstScreen(),
        ),
      ),
    );
  }
}
