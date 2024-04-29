import 'package:diabetes_safety/models/option_model.dart';
import 'package:diabetes_safety/models/profile.dart';
import 'package:diabetes_safety/presentation/screens/add_alarm_screen.dart';
import 'package:diabetes_safety/presentation/screens/bmi_screen.dart';
import 'package:diabetes_safety/presentation/screens/effects_screen.dart';
import 'package:diabetes_safety/presentation/screens/expect_screen.dart';
import 'package:diabetes_safety/presentation/screens/food_screen.dart';
import 'package:diabetes_safety/presentation/screens/protection_screen.dart';
import 'package:diabetes_safety/presentation/screens/sugar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.profile});
  final List<Option> listFirstOptions = [
    Option(title: 'قياس السكر', image: 'assets/sugar.png'),
    Option(title: 'الأطعمة الصحية', image: 'assets/food.png'),
    Option(title: 'كتلة الجسم', image: 'assets/weight.png'),
    Option(title: 'التوقع', image: 'assets/expect.png'),
  ];
  final List<Option> listSecondOptions = [
    Option(title: 'منبه بالادوية ومواعيد الطبيب', image: 'assets/doctor.png'),
    Option(title: 'أعراض واثار مرض السكر', image: 'assets/effects.png'),
    Option(title: 'مزيد من المعلومات حول الوقاية من مرض السكر', image: 'assets/pill.png'),
  ];
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'مرحبا بك ${profile.name}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 5,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listFirstOptions.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 50,
                crossAxisSpacing: 50,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Sugar(),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FoodScreen(),
                        ),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BMIScreen(),
                        ),
                      );
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExpectScreen(),
                        ),
                      );
                      break;
                  }
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(listFirstOptions[index].image),
                      Text(
                        listFirstOptions[index].title,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: listSecondOptions.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddAlarmScreen(),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EffectsScreen(),
                        ),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProtectionScreen(),
                        ),
                      );
                      break;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * .8,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                listSecondOptions[index].title,
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            Image.asset(listSecondOptions[index].image),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
