import 'package:diabetes_safety/core/utile/shared/extentions.dart';
import 'package:diabetes_safety/cubit/reminder/reminder_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderCard extends StatelessWidget {
  final String image;
  final String name;
  final DateTime date;
  final int id;
  const ReminderCard({super.key, required this.image, required this.name, required this.date, required this.id});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 150,
          child: Card(
            child: Row(
              children: [
                Image.asset('assets/$image.png'),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'الأسم: ',
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * .55),
                          child: Text(
                            name,
                            style: Theme.of(context).textTheme.displayLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * .7,
                      height: 1,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        Text(
                          'اليوم: ',
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          date.formattedDate,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              context.read<ReminderCubit>().deleteReminder(id.toString());
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
