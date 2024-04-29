import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:diabetes_safety/cubit/main_cubit/main_cubit.dart';
import 'package:diabetes_safety/data/repository/database.dart';
import 'package:diabetes_safety/presentation/screens/about_screen.dart';
import 'package:diabetes_safety/presentation/screens/emergency_screen.dart';
import 'package:diabetes_safety/presentation/screens/home_screen.dart';
import 'package:diabetes_safety/presentation/screens/profile_screen.dart';
import 'package:diabetes_safety/presentation/screens/reports_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              drawer: Drawer(
                child: Column(
                  children: [
                    DrawerHeader(
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(
                        'ملف الشخصي',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: Text(
                        'عن التطبيق',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()));
                      },
                    ),
                    BlocBuilder<MainCubit, MainState>(
                      builder: (context, state) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Switch.adaptive(
                          activeColor: AppPalette.primaryButtonColorLight,
                          value: Database.database.getBool('isDark') ?? false,
                          onChanged: (value) => context.read<MainCubit>().changeTheme(value),
                        ),
                        title: Text(
                          'الوضع المظلم',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'تسجيل خروج',
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: context.read<MainCubit>().index,
                onTap: (index) => context.read<MainCubit>().changeScreen(index),
                selectedItemColor: AppPalette.bottomNavigationBarActiveColor,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسة"),
                  BottomNavigationBarItem(icon: Icon(Icons.call), label: "الطوارئ"),
                  BottomNavigationBarItem(icon: Icon(Icons.file_present_rounded), label: "التقارير"),
                ],
              ),
              body: FutureBuilder(
                future: context.read<MainCubit>().getProfile(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final int index = context.read<MainCubit>().index;
                    switch (index) {
                      case 0:
                        return HomeScreen(profile: snapshot.data!);
                      case 1:
                        return const EmergencyScreen();
                      case 2:
                        return const ReportScreen();
                    }
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'حدث خطأ',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: AppPalette.primaryButtonColorLight),
                    );
                  }
                },
              ));
        },
      ),
    );
  }
}
