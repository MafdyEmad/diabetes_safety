import 'package:diabetes_safety/cubit/sugar_cubit/sugar_cubit.dart';
import 'package:diabetes_safety/models/option_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sugar extends StatelessWidget {
  const Sugar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Option> meal = [
      Option(title: 'قبل الغداء ', image: 'assets/lunch.png'),
      Option(title: 'بعد الغداء ', image: 'assets/lunch.png'),
      Option(title: 'قبل الفطار ', image: 'assets/breakfast.png'),
      Option(title: 'بعد الفطار ', image: 'assets/breakfast.png'),
      Option(title: 'قبل العشاء ', image: 'assets/dinner.png'),
      Option(title: 'بعد العشاء ', image: 'assets/dinner.png'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'قياس السكر',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'قم باضافه قراءه السكر هنا',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.read<SugarCubit>().changeSugarValue(true),
                        style:
                            ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: Colors.greenAccent),
                        child: const Icon(Icons.add),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<SugarCubit, SugarState>(
                            builder: (context, state) => Text(
                              context.read<SugarCubit>().sugarValue.toString(),
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'ملغم/دل',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () => context.read<SugarCubit>().changeSugarValue(false),
                        style:
                            ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: Colors.greenAccent),
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'مع أي وجبة سجلت القياس؟',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return BlocBuilder<SugarCubit, SugarState>(
                    builder: (context, state) => GestureDetector(
                      onTap: () => context.read<SugarCubit>().changeMealType(index),
                      child: Card(
                        color: context.read<SugarCubit>().mealType == index ? Colors.greenAccent : null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              meal[index].image,
                              width: 40,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              meal[index].title,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.6,
              height: 60,
              child: GestureDetector(
                child: Card(
                  child: Center(
                    child: Text(
                      'إضافة',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
