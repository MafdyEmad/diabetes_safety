import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:diabetes_safety/core/utile/shared/extentions.dart';
import 'package:diabetes_safety/core/utile/shared/loading.dart';
import 'package:diabetes_safety/core/utile/shared/show_message.dart';
import 'package:diabetes_safety/core/utile/shared/snack_bar.dart';
import 'package:diabetes_safety/cubit/alarm_cubit/alarm_cubit.dart';
import 'package:diabetes_safety/cubit/reminder/reminder_cubit.dart';
import 'package:diabetes_safety/data/repository/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  late final TextEditingController doctorController;
  late final TextEditingController medicineController;
  @override
  void initState() {
    doctorController = TextEditingController();
    medicineController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    doctorController.dispose();
    medicineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime? doctorDate;
    DateTime? medicineDate;

    return BlocListener<ReminderCubit, ReminderState>(
      listener: (context, state) {
        if (state is ReminderLoading) {
          showLoading(context);
        } else if (state is ReminderSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
        } else if (state is ReminderFail) {
          Navigator.pop(context);
          showMessage(context,
              title: Text(
                'حدث خطأ',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'حاول مرة اخري',
                      style: Theme.of(context).textTheme.displayMedium,
                    ))
              ]);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/doctor_icon.png'),
              Text(
                'منبه بمواعيد الطبيب',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 75,
                child: Card(
                  child: Center(
                    child: TextFormField(
                      controller: doctorController,
                      style: Theme.of(context).textTheme.displayMedium,
                      decoration: const InputDecoration(
                        hintText: 'الأسم: ',
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await showDatePicker(
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: Database.database.getBool('isDark') == true
                              ? const ColorScheme.dark(primary: AppPalette.primaryButtonColorLight)
                              : const ColorScheme.light(primary: AppPalette.primaryButtonColorLight),
                        ),
                        child: child!,
                      );
                    },
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 60),
                    ),
                  ).then(
                    (date) async {
                      if (date != null) {
                        await showTimePicker(
                          context: context,
                          initialEntryMode: TimePickerEntryMode.dialOnly,
                          initialTime: TimeOfDay.now(),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: Database.database.getBool('isDark') == true
                                    ? const ColorScheme.dark(primary: AppPalette.primaryButtonColorLight)
                                    : const ColorScheme.light(primary: AppPalette.primaryButtonColorLight),
                              ),
                              child: child!,
                            );
                          },
                        ).then((time) {
                          if (time != null) {
                            doctorDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                            context.read<AlarmCubit>().changeTime();
                          }
                        });
                      }
                    },
                  );
                },
                child: SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: Card(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: BlocBuilder<AlarmCubit, AlarmState>(
                        builder: (context, state) {
                          return Text(
                            'التوقيت واليوم:${doctorDate == null ? '' : doctorDate!.formattedDate}',
                            style: Theme.of(context).textTheme.displayMedium,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (doctorController.text.trim().isEmpty && doctorDate == null) {
                    showSnackBar(
                      context,
                      Text('يجل ادخال الاسم و التوقيت', style: Theme.of(context).textTheme.displayMedium),
                    );
                    return;
                  }

                  if (doctorDate != null) {
                    context.read<ReminderCubit>().makeReminder(name: doctorController.text, type: 0, date: doctorDate!);
                  }
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * .5,
                  height: MediaQuery.sizeOf(context).height * .08,
                  child: GestureDetector(
                    child: Card(
                      child: Center(
                        child: Text(
                          'إضافة',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 30,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              Image.asset('assets/medicine.png'),
              Text(
                'منبه بمواعيد الأدوية',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 75,
                child: Card(
                  child: Center(
                    child: TextFormField(
                      controller: medicineController,
                      style: Theme.of(context).textTheme.displayMedium,
                      decoration: const InputDecoration(
                        hintText: 'الأسم: ',
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await showDatePicker(
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: Database.database.getBool('isDark') == true
                              ? const ColorScheme.dark(primary: AppPalette.primaryButtonColorLight)
                              : const ColorScheme.light(primary: AppPalette.primaryButtonColorLight),
                        ),
                        child: child!,
                      );
                    },
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 60),
                    ),
                  ).then(
                    (date) async {
                      if (date != null) {
                        await showTimePicker(
                          context: context,
                          initialEntryMode: TimePickerEntryMode.dialOnly,
                          initialTime: TimeOfDay.now(),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: Database.database.getBool('isDark') == true
                                    ? const ColorScheme.dark(primary: AppPalette.primaryButtonColorLight)
                                    : const ColorScheme.light(primary: AppPalette.primaryButtonColorLight),
                              ),
                              child: child!,
                            );
                          },
                        ).then((time) {
                          if (time != null) {
                            medicineDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                            context.read<AlarmCubit>().changeTime();
                          }
                        });
                      }
                    },
                  );
                },
                child: SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: Card(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: BlocBuilder<AlarmCubit, AlarmState>(
                        builder: (context, state) {
                          return Text(
                            'التوقيت واليوم:${medicineDate == null ? '' : medicineDate!.formattedDate}',
                            style: Theme.of(context).textTheme.displayMedium,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (medicineController.text.trim().isEmpty && medicineDate == null) {
                    showSnackBar(
                      context,
                      Text('يجل ادخال الاسم و التوقيت', style: Theme.of(context).textTheme.displayMedium),
                    );
                    return;
                  }

                  context
                      .read<ReminderCubit>()
                      .makeReminder(name: medicineController.text, type: 1, date: medicineDate!);
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * .5,
                  height: MediaQuery.sizeOf(context).height * .08,
                  child: GestureDetector(
                    child: Card(
                      child: Center(
                        child: Text(
                          'إضافة',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
