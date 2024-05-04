import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:diabetes_safety/cubit/reminder/reminder_cubit.dart';
import 'package:diabetes_safety/models/reminder.dart';
import 'package:diabetes_safety/presentation/screens/alarm_screen.dart';
import 'package:diabetes_safety/presentation/widgets/reminder_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAlarmScreen extends StatelessWidget {
  const AddAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppPalette.primaryButtonColorLight,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AlarmScreen()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          'مواعيد الأدوية & والطبيب',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<ReminderCubit, ReminderState>(
          buildWhen: (previous, current) => current is ReminderDelete,
          builder: (context, state) {
            return FutureBuilder<List<Reminder>>(
                future: context.read<ReminderCubit>().getReminders(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ReminderCard(
                        image: snapshot.data![index].type == 0 ? 'doctor_icon' : 'medicine',
                        name: snapshot.data![index].name,
                        date: snapshot.data![index].date,
                        id: snapshot.data![index].id!,
                      ),
                    );
                  } else if (snapshot.hasError) {
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
                });
          },
        ),
      ),
    );
  }
}
