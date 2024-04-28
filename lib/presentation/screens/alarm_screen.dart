import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:diabetes_safety/cubit/alarm_cubit/alarm_cubit.dart';
import 'package:diabetes_safety/data/repository/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? doctorDate;
    TimeOfDay? doctorTime;
    DateTime? medicineDate;
    TimeOfDay? medicineTime;
    return Scaffold(
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
                        doctorDate = date;
                        doctorTime = time;
                        context.read<AlarmCubit>().changeTime();
                      });
                    }
                  },
                );

                // context.read<AlarmCubit>().changeDoctorTime(date);
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
                          'التوقيت واليوم: ${context.read<AlarmCubit>().getTime(date: doctorDate, time: doctorTime)}',
                          style: Theme.of(context).textTheme.displayMedium,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
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
                        medicineDate = date;
                        medicineTime = time;
                        context.read<AlarmCubit>().changeTime();
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
                          'التوقيت واليوم: ${context.read<AlarmCubit>().getTime(date: medicineDate, time: medicineTime)}',
                          style: Theme.of(context).textTheme.displayMedium,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
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
          ],
        ),
      ),
    );
  }
}
