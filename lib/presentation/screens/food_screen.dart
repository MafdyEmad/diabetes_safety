import 'package:diabetes_safety/presentation/screens/fruits_screen.dart';
import 'package:diabetes_safety/presentation/screens/vegetables_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الأطعمة الصحية',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FruitScreen())),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * .3,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * .3,
                      child: Image.asset(
                        'assets/fruits.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'الفواكه',
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const VegetablesScreen())),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * .3,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * .3,
                      child: Image.asset(
                        'assets/vegetables.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'الخضروات',
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
