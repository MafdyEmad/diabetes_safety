import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:diabetes_safety/cubit/expect/expect_cubit.dart';
import 'package:diabetes_safety/data/repository/database.dart';
import 'package:diabetes_safety/presentation/widgets/expect_card.dart';
import 'package:diabetes_safety/presentation/widgets/expect_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Smoke { smoker, quitSmoking, nonSmoker }

class ExpectScreen extends StatelessWidget {
  const ExpectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'توقع السكر',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: BlocBuilder<ExpectCubit, ExpectState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  ExpectCard(
                    child: Row(
                      children: [
                        Text(
                          'الجنس',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const Spacer(),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context.read<ExpectCubit>().changeGender(false),
                            child: Card(
                              color: !context.read<ExpectCubit>().isMale ? Colors.greenAccent : null,
                              child: const Icon(
                                color: Color(0xFFd734a5),
                                Icons.female,
                                size: 45,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context.read<ExpectCubit>().changeGender(true),
                            child: Card(
                              color: context.read<ExpectCubit>().isMale ? Colors.greenAccent : null,
                              child: const Icon(
                                Icons.male,
                                color: Color(0xFF2038c7),
                                size: 45,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ExpectCard(
                    child: Row(
                      children: [
                        Text(
                          'العمر',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          width: 70,
                          child: const ExpectTextFiled(
                            hintText: '25',
                            isDecimal: false,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ExpectCard(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            'مريض ضغط',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const Spacer(),
                          Radio(
                            value: true,
                            groupValue: context.read<ExpectCubit>().haveBloodPressure,
                            onChanged: (value) {
                              context.read<ExpectCubit>().changeHaveBloodPressure(value!);
                            },
                          ),
                          Text(
                            'نعم',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Radio(
                            value: false,
                            groupValue: context.read<ExpectCubit>().haveBloodPressure,
                            onChanged: (value) {
                              context.read<ExpectCubit>().changeHaveBloodPressure(value!);
                            },
                          ),
                          Text(
                            'لا',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ExpectCard(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            'مريض القلب',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const Spacer(),
                          Radio(
                            value: true,
                            groupValue: context.read<ExpectCubit>().haveHeartDisease,
                            onChanged: (value) {
                              context.read<ExpectCubit>().changeHaveHeartDisease(value!);
                            },
                          ),
                          Text(
                            'نعم',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Radio(
                            value: false,
                            groupValue: context.read<ExpectCubit>().haveHeartDisease,
                            onChanged: (value) {
                              context.read<ExpectCubit>().changeHaveHeartDisease(value!);
                            },
                          ),
                          Text(
                            'لا',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ExpectCard(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            'التدخين',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Database.database.getBool('isDark') == true
                                  ? AppPalette.cardColorDark
                                  : AppPalette.cardColorLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: MediaQuery.of(context).size.width * .45,
                            height: 50,
                            child: DropdownButton<String>(
                              underline: Container(),
                              value: context.read<ExpectCubit>().smokeValue,
                              isExpanded: true,
                              items: context.read<ExpectCubit>().smokeTypes.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: Theme.of(context).textTheme.displayMedium,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                context.read<ExpectCubit>().changeSmoke(newValue!);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ExpectCard(
                    child: Row(
                      children: [
                        Text(
                          'مؤشر كتلة الجسمBMI',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const Spacer(),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: const ExpectTextFiled(
                              hintText: '24.3',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ExpectCard(
                    child: Row(
                      children: [
                        Text(
                          'السكر التراكمي',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const Spacer(),
                        Container(
                          width: MediaQuery.sizeOf(context).width * .25,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: const ExpectTextFiled(
                            hintText: '6.8',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ExpectCard(
                    child: Row(
                      children: [
                        Text(
                          'السكر العشوائي',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const Spacer(),
                        Container(
                          width: MediaQuery.sizeOf(context).width * .25,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: const ExpectTextFiled(
                            hintText: '200',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * .08,
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: Card(
                        child: Center(
                          child: Text(
                            'النتيجة',
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
        },
      ),
    );
  }
}
