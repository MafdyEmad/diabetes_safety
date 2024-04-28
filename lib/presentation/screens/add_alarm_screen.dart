import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:diabetes_safety/presentation/screens/alarm_screen.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Card(
                child: Row(
                  children: [
                    Image.asset('assets/doctor_icon.png'),
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
                                'د/ أحمد الشرنوبي',
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
                              '08 فبراير 2024 . 6:56 م',
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
            SizedBox(
              height: 150,
              child: Card(
                child: Row(
                  children: [
                    Image.asset('assets/medicine.png'),
                    const SizedBox(width: 15),
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
                                'د/ الميتفورمين',
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
                              '08 فبراير 2024 . 6:56 م',
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
          ],
        ),
      ),
    );
  }
}
