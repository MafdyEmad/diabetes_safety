import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Text(
              'التقارير',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset('assets/report.png'),
              title: Text(
                '03 فبراير 2024  1:36 م',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              subtitle: Text(
                'قياس السكر قبل العشاء 130 ملغم/دل',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
