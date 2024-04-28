import 'package:diabetes_safety/core/utile/show_message.dart';
import 'package:diabetes_safety/cubit/bmi_cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BmiCubit, BmiState>(
      listener: (context, state) {
        if (state is BmCalcBMI) {
          showMessage(
            context,
            title: Text(
              'نتيجة مؤشر كتلة الجسم الخاص بك',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            content: SizedBox(
              height: 100,
              child: Card(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: context.read<BmiCubit>().bmi.toString()));

                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('Text copied to clipboard'),
                            ));
                          },
                          icon: const Icon(Icons.copy),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        context.read<BmiCubit>().bmi.toString(),
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'كتلة الجسم',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              BlocBuilder<BmiCubit, BmiState>(
                builder: (context, state) => Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.read<BmiCubit>().changeGender(false),
                          child: Card(
                            color: !context.read<BmiCubit>().isMale ? Colors.greenAccent : null,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(
                                  color: Color(0xFFd734a5),
                                  Icons.female,
                                  size: 100,
                                ),
                                Text(
                                  'انثي',
                                  style: Theme.of(context).textTheme.displayLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.read<BmiCubit>().changeGender(true),
                          child: Card(
                            color: context.read<BmiCubit>().isMale ? Colors.greenAccent : null,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(
                                  Icons.male,
                                  color: Color(0xFF2038c7),
                                  size: 100,
                                ),
                                Text(
                                  'ذكر',
                                  style: Theme.of(context).textTheme.displayLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              BlocBuilder<BmiCubit, BmiState>(
                builder: (context, state) => Expanded(
                  flex: 2,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'الطول (بالسنتيمتر)',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              'cm',
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              context.read<BmiCubit>().height.toInt().toString(),
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Slider(
                          thumbColor: Colors.greenAccent,
                          activeColor: Colors.greenAccent,
                          inactiveColor: Colors.grey,
                          min: 50,
                          max: 300,
                          value: context.read<BmiCubit>().height,
                          onChanged: (value) {
                            context.read<BmiCubit>().changeSliderValue(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'العمر',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () => context.read<BmiCubit>().changeAge(true),
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(), backgroundColor: Colors.greenAccent),
                                  child: const Icon(Icons.add),
                                ),
                                BlocBuilder<BmiCubit, BmiState>(
                                  builder: (context, state) => Text(
                                    context.read<BmiCubit>().age.toString(),
                                    style: Theme.of(context).textTheme.displayMedium,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => context.read<BmiCubit>().changeAge(false),
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(), backgroundColor: Colors.greenAccent),
                                  child: const Icon(Icons.remove),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'الوزن',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () => context.read<BmiCubit>().changeWeight(true),
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(), backgroundColor: Colors.greenAccent),
                                  child: const Icon(Icons.add),
                                ),
                                BlocBuilder<BmiCubit, BmiState>(
                                  builder: (context, state) => Text(
                                    context.read<BmiCubit>().weight.toString(),
                                    style: Theme.of(context).textTheme.displayMedium,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => context.read<BmiCubit>().changeWeight(false),
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(), backgroundColor: Colors.greenAccent),
                                  child: const Icon(Icons.remove),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GestureDetector(
                  onTap: () => context.read<BmiCubit>().calculateBMI(),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * .6,
                    child: const Card(
                      child: Center(
                        child: Text(
                          '=',
                          style: TextStyle(fontSize: 60),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
